const hyprland = await Service.import("hyprland");

export default () =>
	Widget.Label({
		class_name: "client-title",
		label: hyprland.active.client.bind("title"),
	});
