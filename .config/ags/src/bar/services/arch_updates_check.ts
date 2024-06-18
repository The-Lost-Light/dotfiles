const netowrk = await Service.import("network");

export default new (class UpdateService extends Service {
	static {
		Service.register(
			this,
			{},
			{
				"aur-helper": ["string", "w"],
				"check-interval": ["int", "w"],
				"update-packages": ["int", "r"],
				packages: ["jsobject", "r"],
			},
		);
	}

	constructor() {
		super();
		// netowrk.connect("")
		this.#setChecker();
	}

	#aur_helper = "paru";
	#interval = 60000;

	#packages = [""];
	#updates = Variable(0);
	#prompt = "\x1b[34m\n:: Update Completed!\n\x1b[33m:: Press Enter to exit!\x1b[0m";

	#signal_id: number | null = null;

	set aur_helper(helper: string) {
		this.#aur_helper = helper;
		this.#setChecker();
	}

	set check_interval(interval: number) {
		this.#interval = interval;
		this.#setChecker();
	}

	get update_packages() {
		return this.#updates.value;
	}

	get packages() {
		return this.#packages
			.map(c => {
				const s = c.split(" ");
				return `${s[0]} ${s[3]}`;
			})
			.join("\n");
	}

	#setChecker() {
		if (this.#updates.is_polling) this.#updates.stopPoll();
		if (this.#signal_id) this.#updates.disconnect(this.#signal_id);

		this.#updates = Variable(0, {
			poll: [
				this.#interval,
				["sh", "-c", `checkupdates; ${this.#aur_helper} -Qua || true`],
				s => {
					this.#packages = s.split("\n");
					return s !== "" ? this.#packages.length : 0;
				},
			],
		});
		this.#signal_id = this.#updates.connect("changed", () => {
			this.changed("update-packages");
			this.changed("packages");
		});
	}

	update() {
		Utils.execAsync(`kitty fish -c "${this.#aur_helper}; read -P '${this.#prompt}'"`).then(
			() => (this.#updates.value = 0),
		);
	}
})();
