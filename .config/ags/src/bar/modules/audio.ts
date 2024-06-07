const audio = await Service.import("audio");

const icons = {
	speaker: {
		threshold: [101, 67, 34, 1, 0],
		101: "audio-volume-overamplified-symbolic",
		67: "audio-volume-high-symbolic",
		34: "audio-volume-medium-symbolic",
		1: "audio-volume-low-symbolic",
		0: "audio-volume-muted-symbolic",
	},
	microphone: {
		threshold: [67, 34, 1, 0],
		67: "mic-volume-high",
		34: "mic-volume-medium",
		1: "mic-volume-low",
		0: "mic-volume-muted",
	},
};

const icon = (type = "speaker") =>
	Utils.merge([audio[type].bind("is_muted"), audio[type].bind("volume")], (mute, volume) =>
		!mute ? icons[type].threshold.find((threshold: number) => threshold <= volume * 100) ?? 0 : 0,
	).as(key => icons[type][key]);

const stream = (type = "speaker") =>
	Widget.Button({
		class_name: type,
		child: Widget.Box({
			children: [
				Widget.Icon({
					icon: icon(type),
				}),
				Widget.Label({
					label: audio[type].bind("volume").as((v: number) => `${Math.round(v * 100)}%`),
					visible: audio[type].bind("is_muted").as((m: boolean) => !m),
				}),
			],
		}),
		on_clicked: () => (audio[type].is_muted = !audio[type].is_muted),
		on_scroll_up: () => Utils.execAsync(["sh", "-c", `$CONFIG/hypr/scripts/audio.fish --${type} -i`]),
		on_scroll_down: () => Utils.execAsync(["sh", "-c", `$CONFIG/hypr/scripts/audio.fish --${type} -d`]),
	});
export default () =>
	Widget.Box({
		children: [stream("speaker"), stream("microphone")],
	});
