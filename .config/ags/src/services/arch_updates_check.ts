export default new (class UpdateService extends Service {
	static {
		Service.register(
			this,
			{},
			{
				terminal: ["string", "w"],
				"accent-color": ["string", "w"],
				"update-packages": ["int", "r"],
				packages: ["jsobject", "r"],
			},
		);
	}

	constructor() {
		super();
	}

	#terminal: string | undefined;
	#accent_color = "#ffffff";
	#AUR_helper = "paru";

	#updates = Variable(0);
	#packages = [""];
	#prompt = "\x1b[34m\n:: Update Completed!\n\x1b[33m:: Press Enter to exit!\x1b[0m";

	#signal_id: number | null = null;

	set terminal(terminal: string) {
		this.#terminal = terminal;
	}

	set accent_color(color: string) {
		this.#accent_color = color;
	}

	get update_packages() {
		return this.#updates.value;
	}

	get packages() {
		return this.#packages
			.map(c => {
				if (c.length > 0) {
					const s = c.split(" ");
					const [old_version, new_version] = [s[1], s[3]].map(s => s.split(/([:._-])/));
					let index = 0;
					for (const i in old_version)
						if (old_version[i] !== new_version[i]) {
							index = Number(i);
							break;
						}
					return `${s[0]}:    ${old_version.slice(0, index).join("")}<span foreground="${this.#accent_color}">${new_version.slice(index).join("")}</span>`;
				}
			})
			.join("\n");
	}

	setChecker({ interval = 600, AUR_helper = "" }) {
		this.#AUR_helper = AUR_helper;

		if (this.#updates.is_polling) this.#updates.stopPoll();
		if (this.#signal_id) this.#updates.disconnect(this.#signal_id);

		this.#updates = Variable(0, {
			poll: [
				interval * 1000,
				["sh", "-c", `checkupdates; ${this.#AUR_helper} -Qua; true`],
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
		if (this.#terminal)
			Utils.execAsync(`${this.#terminal} fish -c "${this.#AUR_helper}; read -P '${this.#prompt}'"`).then(
				() => (this.#updates.value = 0),
			);
	}
})();
