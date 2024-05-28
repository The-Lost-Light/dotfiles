import Gdk from "@girs/gdk-3.0";
const systemtray = await Service.import("systemtray");

function SystemTray() {
  const items = systemtray.bind("items").as((items) =>
    items.map((item) =>
      Widget.Button({
        child: Widget.Icon({ icon: item.bind("icon") }),
        on_primary_click: (_, event: Gdk.Event) => item.activate(event),
        on_secondary_click: (_, event: Gdk.Event) => item.openMenu(event),
        tooltip_markup: item.bind("tooltip_markup"),
      }),
    ),
  );

  return Widget.Box({
    children: items,
  });
}
export default SystemTray;
