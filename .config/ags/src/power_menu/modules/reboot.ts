export default () =>
	Widget.Button({
		class_name: "reboot",
		child: Widget.Label("󰜉"),
		onClicked: () => Utils.exec("systemctl reboot"),
	});
