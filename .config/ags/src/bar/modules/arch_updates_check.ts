const upgrades = Variable(["0"], {
	poll: [60000, ["sh", "-c", "$CONFIG/hypr/scripts/arch_updates_check.fish"], out => out.split("\n")],
});

export default () =>
	Widget.Button({
		child: Widget.Box({
			children: [
				Widget.Icon("folder-download-symbolic"),
				Widget.Label({
					label: upgrades.bind().as(v => v[0]),
				}),
			],
		}),
		visible: upgrades.bind().as(v => v[0] !== "0"),
		tooltip_markup: upgrades.bind().as(v => v.slice(1).toString()),
		on_clicked: () => Utils.execAsync(["sh", "-c", "$CONFIG/hypr/scripts/arch_updates_check.fish -u"]),
	});
