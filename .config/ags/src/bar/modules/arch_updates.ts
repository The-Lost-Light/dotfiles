import update from "../services/arch_updates_check";

update.aur_helper = "paru";
update.check_interval = 600000;

export default () =>
	Widget.Button({
		child: Widget.Box({
			children: [
				Widget.Icon("folder-download-symbolic"),
				Widget.Label({
					label: update.bind("update_packages").as(v => v.toString()),
				}),
			],
		}),
		visible: update.bind("update_packages").as(v => !!v),
		tooltip_markup: update.bind("packages"),
		on_clicked: () => update.update(),
	});
