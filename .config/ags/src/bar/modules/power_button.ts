import AutoTimeout from "@lib/auto_timeout";

const closeMenu = new AutoTimeout();

export default () =>
	Widget.Button({
		child: Widget.Label(""),
		class_name: "power",
		on_clicked: () => (App.openWindow("power_menu"), closeMenu.restart(3, () => App.closeWindow("power_menu"))),
	});
