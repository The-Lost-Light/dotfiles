import Update from "@services/arch_updates_check";

Update.terminal = "kitty";
Update.setChecker({ interval: 300, AUR_helper: "paru" });

export default () =>
	Widget.Button({
		child: Widget.Box({
			children: [
				Widget.Icon("folder-download-symbolic"),
				Widget.Label({
					label: Update.bind("update_packages").as(v => v.toString()),
				}),
			],
		}),
		visible: Update.bind("update_packages").as(v => !!v),
		tooltip_markup: Update.bind("packages"),
		on_clicked: () => Update.update(),
	});
