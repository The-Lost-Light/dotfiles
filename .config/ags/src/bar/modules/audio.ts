const audio = await Service.import("audio");

const icons = {
	speaker: {
		prefix: "audio-volume-",
		101: "overamplified",
		67: "high",
		34: "medium",
		1: "low",
		0: "muted",
		postfix: "-symbolic",
	},
	microphone: {
		prefix: "mic-",
		on: "on",
		off: "ready",
		postfix: "",
	},
};

const icon = (type = "speaker") =>
	Utils.merge([audio[type].bind("is_muted"), audio[type].bind("volume")], (mute, volume) =>
		type === "microphone"
			? !mute && volume
				? "on"
				: "off"
			: !mute
				? [101, 67, 34, 1, 0].find(threshold => threshold <= volume * 100) ?? 0
				: 0,
	).as(key => icons[type].prefix + icons[type][key] + icons[type].postfix);

const stream = (type = "speaker") =>
	Widget.Box({
		class_name: type,
		children: [
			Widget.Button({
				child: Widget.Icon({
					icon: icon(type),
				}),
				on_clicked: () => (audio[type].is_muted = !audio[type].is_muted),
			}),
			Widget.EventBox({
				child: Widget.Label({
					label: audio[type].bind("volume").as((v: number) => `${Math.round(v * 100)}%`),
					visible: audio[type].bind("is_muted").as((m: boolean) => !m),
				}),
				on_scroll_up: () =>
					Utils.execAsync(`sh -c "$CONFIG/hypr/scripts/audio.fish -${type === "microphone" ? "I" : "i"}"`),
				on_scroll_down: () =>
					Utils.execAsync(`sh -c "$CONFIG/hypr/scripts/audio.fish -${type === "microphone" ? "D" : "d"}"`),
			}),
		],
	});

export default () =>
	Widget.Box({
		children: [stream("speaker"), stream("microphone")],
	});
