const test = Utils.execAsync("sleep infinity");

export default () =>
	Widget.ToggleButton({
		child: Widget.Label("󰒲"),
		onToggled: ({ active, child }) => {
			child.label = active ? "󰒳" : "󰒲";
			// TODO: systemd-inhibit
		},
	});
