import Gtk from "@girs/gtk-3.0";
import Gdk from "@girs/gdk-3.0";

const systemtray = await Service.import("systemtray");

export default () =>
	Widget.Box({
		"class-name": "system_tray",
		children: systemtray.bind("items").as(items =>
			items.map(item =>
				Widget.Button({
					child: Widget.Icon({ icon: item.bind("icon") }),
					"on-primary-click": (_: Gtk.Button, event: Gdk.Event) =>
						item.activate(event),
					"on-middle-click": (_: Gtk.Button, event: Gdk.Event) =>
						item.secondaryActivate(event),
					"on-secondary-click": (_: Gtk.Button, event: Gdk.Event) =>
						item.openMenu(event),
					tooltip_markup: item.bind("tooltip_markup"),
				}),
			),
		),
	});
