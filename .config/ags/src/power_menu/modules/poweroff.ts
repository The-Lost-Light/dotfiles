export default () =>
	Widget.Button({
		class_name: "poweroff",
		child: Widget.Label("󰐥"),
		onClicked: () => Utils.exec("systemctl poweroff"),
	});
