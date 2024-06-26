import Net from "@services/net";

Net.setChecker({ interval: 2, device: "wlp2s0" });

export default () =>
	Widget.Label({
		label: Utils.merge([Net.bind("speed"), Net.bind("unit")], (speed, unit) => `${speed[0]} ${unit[0]}`),
	});
