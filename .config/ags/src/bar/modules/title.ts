const Hyprland = await Service.import("hyprland");

const display = (title: string) => Math.floor((title.length * 80) / new TextEncoder().encode(title).length);

export default () =>
	Widget.Label({
		class_name: "client-title",
		label: Hyprland.active.client.bind("title").as(s => s.slice(0, display(s))),
	});
