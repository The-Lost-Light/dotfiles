import Hyprland from "@services/hyprland";
import Applications from "@services/applications";

export default () =>
	Widget.Box({
		spacing: 8,
	}).hook(Hyprland.active.client, self => {
		const entry = Applications.getEntry(Hyprland.active.client.class ?? "");
		const icon = entry?.icon_name ?? "";
		const title = entry?.name ?? Hyprland.getClient(Hyprland.active.client.address)?.title ?? "";
		self.children = [Widget.Icon({ size: 18, icon }), Widget.Label(title)];
		self.children[0].visible = !!icon;
		self.visible = !!title;
	});
