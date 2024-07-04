import { autoTimeout } from "@lib/utils";

export default () =>
	Widget.Button({
		child: Widget.Label(""),
		on_clicked: () => (App.openWindow("power_menu"), autoTimeout(3, () => App.closeWindow("power_menu"))),
	});
