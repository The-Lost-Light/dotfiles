import Audio from "@services/audio";

Audio.script = "$CONFIG/hypr/scripts/audio.fish";

const stream = (type = "speaker") =>
	Widget.Button({
		class_name: `audio ${type}`,
		child: Widget.Box({
			children: [
				Widget.Icon({
					icon: Audio.bind("icon").as(i => i[type]),
				}),
				Widget.Label({
					label: Audio[type].bind("volume").as((v: number) => `${Math.round(v * 100)}%`),
					visible: Audio[type].bind("is_muted").as((m: boolean) => !m),
				}),
			],
		}),
		on_clicked: () => (Audio[type].is_muted = !Audio[type].is_muted),
		on_secondary_click: () => Utils.execAsync("pavucontrol -m"),
		on_scroll_up: () => Audio.tweakFlag(`--${type} -i`),
		on_scroll_down: () => Audio.tweakFlag(`--${type} -d`),
	});
export default () =>
	Widget.Box({
		class_name: "audio",
		children: [stream("speaker"), stream("microphone")],
	});
