const battery = await Service.import("battery");

let status = Utils.merge(
  [battery.bind("percent"), battery.bind("charging")],
  (p, c) => `${p}%` + (c ? " " : ""),
);

export default () =>
  Widget.Box({
    "class-name": "battery",
    visible: battery.bind("available"),
    children: [
      Widget.Icon({
        icon: battery.bind("icon_name"),
        "tooltip-text": status,
      }),
      Widget.Label({
        label: status,
      }),
    ],
  });
