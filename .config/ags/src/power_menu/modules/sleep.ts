export default () =>
	Widget.Button({
		class_name: "sleep",
		child: Widget.Label("󰤄"),
		onClicked: () => (App.closeWindow("power_menu"), Utils.exec("systemctl suspend")),
	});
