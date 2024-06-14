class NetSpeedTestService extends Service {
	static {
		Service.register(this, {}, { "download-speed": ["double", "r"], "upload-speed": ["double", "r"] });
	}

	constructor() {
		super();
	}

	test = "";

	#interface = "lo";
	#net = Variable(
		{},
		{
			poll: [1000, this.#parse],
		},
	);

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
}

export default new NetSpeedTestService();
