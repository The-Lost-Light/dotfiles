export default () =>
	Widget.Button({
		class_name: "sleep",
		child: Widget.Label("󰤄"),
		onClicked: () => {
			Utils.execAsync("ags -t power_menu");
			Utils.exec("systemctl suspend");
		},
	});
