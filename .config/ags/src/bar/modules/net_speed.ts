import Net from "@services/net";

export default () =>
	Widget.Label({
		label: Utils.merge([Net.bind("speed"), Net.bind("unit")], (speed, unit) => `${speed[0]} ${unit[0]}`),
	});
