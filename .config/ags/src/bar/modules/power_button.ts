export default () =>
	Widget.Button({
		child: Widget.Label(""),
		on_clicked: () => (App.toggleWindow("power_menu"), Utils.timeout(3000, () => App.closeWindow("power_menu"))),
	});
