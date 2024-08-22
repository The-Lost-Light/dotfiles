export default new (class Inhibit extends Service {
	static {
		Service.register(
			this,
			{},
			{
				"is-inhibit": ["boolean", "r"],
			},
		);
	}

	constructor() {
		super();
	}

	#id: number | undefined;

	get is_inhibit() {
		return this.#id !== undefined;
	}

	#inhibit(command: string, data: string) {
		const output = Utils.exec(
			`dbus-send --print-reply --dest=org.freedesktop.ScreenSaver /org/freedesktop/ScreenSaver org.freedesktop.ScreenSaver.${command} ${data}`,
		);
		return command === "Inhibit" ? Number(output.split(" ").pop()) : undefined;
	}

	toggle() {
		if (this.#id === undefined) this.#id = this.#inhibit("Inhibit", "string:'ags' string:'Manual pause'");
		else this.#id = this.#inhibit("UnInhibit", `uint32:${this.#id}`);
		this.changed("is-inhibit");
	}
})();
