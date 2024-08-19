import AutoTimeout from "@lib/auto_timeout";

const closeMenu = new AutoTimeout();

export default () =>
	Widget.Button({
		class_name: "power",
		child: Widget.Label(""),
		on_clicked: () => (App.openWindow("power_menu"), closeMenu.restart(4, () => App.closeWindow("power_menu"))),
	});
