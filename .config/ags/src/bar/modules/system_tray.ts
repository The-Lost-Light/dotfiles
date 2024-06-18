const Systemtray = await Service.import("systemtray");

export default () =>
	Widget.Box({
		class_name: "system_tray",
		children: Systemtray.bind("items").as(items =>
			items.map(item =>
				Widget.Button({
					child: Widget.Icon({ icon: item.bind("icon") }),
					on_primary_click: (_, event) => (item.is_menu === false ? item.activate(event) : item.openMenu(event)),
					on_middle_click: (_, event) => item.secondaryActivate(event),
					on_secondary_click: (_, event) => item.openMenu(event),
					tooltip_markup: item.bind("tooltip_markup"),
				}),
			),
		),
	});
