const battery = await Service.import("battery");

const status = Utils.merge([battery.bind("percent"), battery.bind("charging")], (p, c) => `${p}%` + (c ? " " : ""));

export default () =>
	Widget.Box({
		visible: battery.bind("available"),
		children: [
			Widget.Icon({
				icon: battery.bind("icon_name"),
			}),
			Widget.Label({ label: status }),
		],
	});
