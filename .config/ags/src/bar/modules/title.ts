import Hyprland from "../services/hyprland";

export default () =>
	Widget.Label({
		class_name: "client-title",
		label: Hyprland.bind("active_init_title"),
	});
