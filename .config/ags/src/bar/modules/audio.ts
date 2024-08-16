import Audio from "@services/audio";

Audio.script = "$CONFIG/hypr/scripts/audio.nu";

const stream = (type = "speaker") =>
	Widget.Button({
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
		on_clicked: () => Audio.tweakFlag(`${type} toggle`),
		on_secondary_click: () => Utils.execAsync("pwvucontrol"),
		on_scroll_up: () => Audio.tweakFlag(`${type} increase`),
		on_scroll_down: () => Audio.tweakFlag(`${type} decrease`),
	});

export default () =>
	Widget.Box({
		class_name: "audio",
		children: [stream("speaker"), stream("microphone")],
	});
