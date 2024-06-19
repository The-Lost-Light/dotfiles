const Hyprland = await Service.import("hyprland");

export default () =>
	Widget.Label({
		class_name: "client-title",
		label: Hyprland.active.client.bind("address").as(a => Hyprland.getClient(a)?.initialTitle ?? ""),
	});
