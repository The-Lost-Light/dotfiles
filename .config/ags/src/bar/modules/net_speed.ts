import Net from "../services/net_speed";

Net.interface = "wlp2s0";
Net.interval = 2;

export default () =>
	Widget.Label({
		label: Utils.merge([Net.bind("speed"), Net.bind("unit")], (speed, unit) => {
			return `${speed[0]} ${unit[0]}`;
		}),
	});
