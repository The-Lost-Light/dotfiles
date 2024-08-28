import Update from "@services/arch_updates_check";

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
		visible: Update.bind("update_packages").as(v => v > 0),
		tooltip_markup: Update.bind("packages"),
		on_clicked: () => Update.update(),
	});
