import { Audio } from "resource:///com/github/Aylur/ags/service/audio.js";
import config from "@lib/config";

export default new (class AudioExtends extends Audio {
	static {
		Service.register(
			this,
			{},
			{
				script: ["string", "w"],
				icon: ["string", "r"],
			},
		);
	}

	constructor() {
		super();

		this.connect("speaker-changed", () => this.changed("icon"));
		this.connect("microphone-changed", () => this.changed("icon"));
	}

	#icons = {
		speaker: {
			threshold: [101, 67, 34, 1, 0],
			names: {
				101: "audio-volume-overamplified-symbolic",
				67: "audio-volume-high-symbolic",
				34: "audio-volume-medium-symbolic",
				1: "audio-volume-low-symbolic",
				0: "audio-volume-muted-symbolic",
			},
		},
		microphone: {
			threshold: [67, 34, 1, 0],
			names: {
				67: "mic-volume-high",
				34: "mic-volume-medium",
				1: "mic-volume-low",
				0: "mic-volume-muted",
			},
		},
	};

	#script_path = config.scripts + config.audio.script;

	set script(path: string) {
		this.#script_path = path;
	}

	get icon() {
		const icon = { speaker: "", microphone: "" };
		for (const type of Object.keys(icon)) {
			const key = !this[type].is_muted
				? (this.#icons[type].threshold.find((threshold: number) => threshold <= this[type].volume * 100) ?? 0)
				: 0;
			icon[type] = this.#icons[type].names[key];
		}
		return icon;
	}

	tweakFlag(flag: string) {
		Utils.execAsync(["sh", "-c", `${this.#script_path} ${flag}`]);
	}
})();
