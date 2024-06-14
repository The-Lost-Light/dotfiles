class BrightnessService extends Service {
	static {
		Service.register(
			this,
			{
				"screen-changed": ["double"],
			},
			{
				device: ["string", "r"],
				script: ["string", "w"],
				"brightness-ratio": ["double", "r"],
			},
		);
	}

	constructor() {
		super();

		this.#brightnessChange();

		if (this.#device)
			Utils.monitorFile(`/sys/class/backlight/${this.#device}/brightness`, () => this.#brightnessChange());
	}

	#device = Utils.exec(["sh", "-c", "ls /sys/class/backlight | head -1"]);

	#brightness_ratio = 0;
	#max = Number(Utils.exec("brightnessctl max"));

	#script_path = "";

	get device() {
		return this.#device;
	}

	get brightness_ratio() {
		return this.#brightness_ratio;
	}

	set script(path: string) {
		this.#script_path = path;
	}

	tweakFlag(flag: string) {
		Utils.execAsync(["sh", "-c", `${this.#script_path} ${flag}`]);
	}

	#brightnessChange() {
		let screen_value = Number(Utils.exec("brightnessctl get"));
		this.#brightness_ratio = Math.round((screen_value * 100) / this.#max);

		this.changed("brightness-ratio");

		this.emit("screen-changed", this.#brightness_ratio);
	}

	connect(event = "screen-changed", callback: (_: this, ...args: any[]) => void) {
		return super.connect(event, callback);
	}
}

export default new BrightnessService();
