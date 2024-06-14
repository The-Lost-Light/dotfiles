import Brightness from "../services/brightness";

Brightness.script = "$CONFIG/hypr/scripts/brightness.fish";

const icons = {
	threshold: [51, 0],
	51: "brightness-high",
	0: "brightness-low",
};

export default () =>
	Widget.Box({
		visible: Brightness.bind("device").as(v => !!v),
		children: [
			Widget.Icon({
				icon: Brightness.bind("brightness_ratio")
					.as(volume => icons.threshold.find((threshold: number) => threshold <= volume) ?? 0)
					.as(key => icons[key]),
			}),
			Widget.EventBox({
				child: Widget.Label({ label: Brightness.bind("brightness_ratio").as(v => `${v}%`) }),
				on_scroll_up: () => Brightness.tweakFlag("-i"),
				on_scroll_down: () => Brightness.tweakFlag("-d"),
			}),
		],
	});
