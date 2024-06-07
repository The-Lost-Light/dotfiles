export default () =>
	Widget.Button({
		child: Widget.Label(""),
		on_clicked: () => Utils.execAsync("nwg-drawer -fm nemo -nofs -ovl -term kitty -wm hyprland"),
	});
