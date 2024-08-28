import config from "@lib/config";

export default new (class BrightnessService extends Service {
	static {
		Service.register(
			this,
			{},
			{ device: ["string", "r"], script: ["string", "w"], "brightness-ratio": ["double", "r"], icon: ["string", "r"] },
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

	#icons = {
		threshold: [51, 0],
		names: {
			51: "brightness-high",
			0: "brightness-low",
		},
	};

	#script_path = config.scripts + config.brightness.script;

	get device() {
		return this.#device;
	}

	get brightness_ratio() {
		return this.#brightness_ratio;
	}

	set script(path: string) {
		this.#script_path = path;
	}

	get icon(): string {
		const key = this.#icons.threshold.find((threshold: number) => threshold <= this.#brightness_ratio) ?? 0;
		return this.#icons.names[key];
	}

	#brightnessChange() {
		let screen_value = Number(Utils.exec("brightnessctl get"));
		this.#brightness_ratio = Math.round((screen_value * 100) / this.#max);

		this.changed("brightness-ratio");
		this.changed("icon");
	}

	tweakFlag(flag: string) {
		Utils.execAsync(["sh", "-c", `${this.#script_path} ${flag}`]);
	}
})();
