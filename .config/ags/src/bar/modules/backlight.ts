import Brightness from "@services/brightness";

Brightness.script = App.configDir + "/scripts/brightness.fish";

export default () =>
	Widget.EventBox({
		child: Widget.Box([
			Widget.Icon({
				icon: Brightness.bind("icon"),
			}),
			Widget.Label({ label: Brightness.bind("brightness_ratio").as(v => `${v}%`) }),
		]),
		visible: Brightness.bind("device").as(v => !!v),
		on_scroll_up: () => Brightness.tweakFlag("-i"),
		on_scroll_down: () => Brightness.tweakFlag("-d"),
	});
