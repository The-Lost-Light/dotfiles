export default () =>
	Widget.Button({
		label: "",
		class_name: "launcher",
		on_clicked: () => Utils.execAsync("nwg-drawer -fm nemo -nofs -ovl -term kitty -wm hyprland"),
	});
