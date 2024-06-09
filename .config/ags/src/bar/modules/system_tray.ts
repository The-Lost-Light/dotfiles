import Gtk from "@girs/gtk-3.0";
import Gdk from "@girs/gdk-3.0";

const systemtray = await Service.import("systemtray");

export default () =>
	Widget.Box({
		class_name: "system_tray",
		children: systemtray.bind("items").as(items =>
			items.map(item =>
				Widget.Button({
					child: Widget.Icon({ icon: item.bind("icon") }),
					on_primary_click: (_: Gtk.Button, event: Gdk.Event) =>
						item.is_menu === false ? item.activate(event) : item.openMenu(event),
					on_middle_click: (_: Gtk.Button, event: Gdk.Event) => item.secondaryActivate(event),
					on_secondary_click: (_: Gtk.Button, event: Gdk.Event) => item.openMenu(event),
					tooltip_markup: item.bind("tooltip_markup"),
				}),
			),
		),
	});
