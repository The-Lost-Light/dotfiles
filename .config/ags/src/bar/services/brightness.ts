class BrightnessService extends Service {
	static {
		Service.register(
			this,
			{
				"screen-changed": ["float"],
			},
			{
				"screen-value": ["float", "rw"],
			},
		);
	}

	constructor() {
		super();

		this.#onChange();

		Utils.monitorFile(`/sys/class/backlight/${this.#interface}/brightness`, () => this.#onChange());
	}

	#interface = Utils.exec(["sh", "-c", "ls /sys/class/backlight | head -1"]);

	#screenValue = 0;
	#max = Number(Utils.exec("brightnessctl max"));

	get screen_value() {
		return this.#screenValue;
	}

	set screen_value(percent) {
		if (percent < 0) percent = 0;
		else if (percent > 1) percent = 1;

		Utils.execAsync(`brightnessctl set -q ${percent * 100}%`);
	}

	#onChange() {
		this.#screenValue = Number(Utils.exec("brightnessctl get")) / this.#max;

		this.emit("changed");
		this.notify("screen-value");

		this.emit("screen-changed", this.#screenValue);
	}

	connect(event = "screen-changed", callback: (_: this, ...args: any[]) => void) {
		return super.connect(event, callback);
	}
}

export default new BrightnessService();
