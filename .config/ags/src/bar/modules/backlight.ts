import Brightness from "../services/brightness";

const icons = {
	threshold: [51, 0],
	51: "brightness-high",
	0: "brightness-low",
};

export default () =>
	Widget.Box({
		// visible: ,
		children: [
			Widget.Icon({
				icon: Brightness.bind("screen_value")
					.as(volume => icons.threshold.find((threshold: number) => threshold <= volume * 100) ?? 0)
					.as(key => icons[key]),
			}),
			Widget.EventBox({
				child: Widget.Label({ label: Brightness.bind("screen_value").as(v => `${Math.round(v * 100)}%`) }),
				on_scroll_up: () => Utils.execAsync(["sh", "-c", "$CONFIG/hypr/scripts/brightness.fish -i"]),
				on_scroll_down: () => Utils.execAsync(["sh", "-c", "$CONFIG/hypr/scripts/brightness.fish -d"]),
			}),
		],
	});
