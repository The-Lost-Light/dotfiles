export default () =>
	Widget.Button({
		child: Widget.Label(""),
		on_clicked: () => Utils.execAsync("ags -t power_menu"),
	});
