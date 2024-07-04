import Hyprland from "@services/hyprland";
import Applications from "@services/applications";

export const abc = () =>
	Widget.Label({
		class_name: "client-title",
		label: Hyprland.active
			.bind("client")
			.as(client => Applications.query(client.class)[0]?.name ?? Hyprland.getClient(client.class)),
	});

export default () =>
	Widget.Box({
		class_name: "client-title",
		spacing: 8,
	}).hook(Hyprland.active.client, self => {
		const entry = Applications.getEntry(Hyprland.active.client.class);
		const icon = entry?.icon_name ?? "";
		const title = entry?.name ?? Hyprland.getClient(Hyprland.active.client.address)?.title ?? "";
		self.children = [Widget.Icon(icon), Widget.Label(title)];
		self.children[0].visible = !!icon;
		self.visible = !!title;
	});
