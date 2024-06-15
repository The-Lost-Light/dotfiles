export default new (class NetSpeedTestService extends Service {
	static {
		Service.register(this, {}, { interface: ["string", "rw"], speed: ["double", "r"], unit: ["string", "r"] });
	}

	constructor() {
		super();
		this.#setChecker();
	}

	#interface = "lo";
	#interval = 1;

	#units = ["B/s", "KB/s", "MB/s", "GB/s", "TB/s", "PB/s", "EB/s"];
	#unitBase = 1024;
	#unit = ["B/s", "B/s"];

	#previous_net = this.#parse();
	#speed = Variable(["0", "0"]);
	#signal_id: number | null = null;

	get interface() {
		return this.#interface;
	}
	set interface(device) {
		this.#interface = device;
		this.#setChecker();
	}

	set interval(interval: number) {
		this.#interval = interval;
		this.#setChecker();
	}

	get speed() {
		return this.#speed.value;
	}

	get unit() {
		return this.#unit;
	}

	#setChecker() {
		if (this.#speed.is_polling) this.#speed.stopPoll();
		if (this.#signal_id) this.#speed.disconnect(this.#signal_id);

		this.#speed = Variable(["0", "0"], {
			poll: [this.#interval * 1000, () => this.#get_net()],
		});
		this.#signal_id = this.#speed.connect("changed", () => {
			this.changed("interface");
			this.changed("speed");
			this.changed("unit");
		});
	}

	#get_net() {
		const net = this.#parse();
		const download = net[this.#interface].receive.bytes - this.#previous_net[this.#interface].receive.bytes;
		const upload = net[this.#interface].transmit.bytes - this.#previous_net[this.#interface].transmit.bytes;
		this.#previous_net = net;
		return this.#format([download / this.#interval, upload / this.#interval]);
	}

	#parse() {
		let net = {};
		const data = Utils.readFile("/proc/net/dev").trim().split("\n");
		const type = data[1]
			.trim()
			.split(/[|\s]+/)
			.slice(1, 9);

		for (const devices of data.slice(2)) {
			const device = devices.trim().split(/ +/);
			const name = device[0].slice(0, -1);
			net[name] = { receive: {}, transmit: {} };

			device.slice(1).forEach((element, index) => {
				const direction = index <= 7 ? "receive" : "transmit";
				net[name][direction][type[index % 8]] = element;
			});
		}

		return net;
	}

	#format([download, upload]) {
		let powers = [0, 0];
		while (Math.pow(this.#unitBase, powers[0] + 1) <= download && powers[0] < this.#units.length - 1) powers[0]++;
		while (Math.pow(this.#unitBase, powers[1] + 1) <= upload && powers[1] < this.#units.length - 1) powers[1]++;
		this.#unit = [this.#units[powers[0]], this.#units[powers[1]]];
		return [
			(download / Math.pow(this.#unitBase, powers[0])).toFixed(2),
			(upload / Math.pow(this.#unitBase, powers[1])).toFixed(2),
		];
	}
})();
