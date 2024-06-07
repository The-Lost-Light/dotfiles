const upgrades = Variable(0, {
	poll: [60000, ["sh", "-c", "$CONFIG/hypr/scripts/arch_update_indicator.fish"]],
});

export default () =>
	Widget.Button({
		child: Widget.Box({
			children: [
				Widget.Icon("folder-download-symbolic"),
				Widget.Label({
					label: upgrades.bind().as(v => v.toString()),
				}),
			],
		}),
		visible: upgrades.bind().as(v => Boolean(v)),
		on_clicked: () => Utils.execAsync(["sh", "-c", "$CONFIG/hypr/scripts/arch_update_indicator.fish -u"]),
	});
