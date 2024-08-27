import Battery from "resource:///com/github/Aylur/ags/service/battery.js";

export default () => {
	// const Battery = await Service.import("battery");

	return Widget.Box({
		visible: Battery.bind("available"),
		children: [
			Widget.Icon({
				icon: Battery.bind("icon_name"),
			}),
			Widget.Label({
				label: Utils.merge([Battery.bind("percent"), Battery.bind("charging")], (p, c) => `${p}%` + (c ? " " : "")),
			}),
		],
	});
};
