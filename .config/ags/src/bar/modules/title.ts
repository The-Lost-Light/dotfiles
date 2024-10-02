import Hyprland from "@services/hyprland";
import Applications from "@services/applications";

// Small issue that title not refreash when client closed without manual

export default (monitor?: number) =>
	Widget.Box({
		spacing: 8,
	}).hook(Hyprland, self => {
		const client = Hyprland.getClient(Hyprland.active.client.address);
		if (client?.monitor === monitor) {
			const entry = Applications.getEntry(client?.class ?? "");
			const icon = entry?.icon_name ?? "";
			const title = entry?.name ?? client?.title ?? "";
			self.children = [Widget.Icon({ size: 18, icon }), Widget.Label(title)];
			self.children[0].visible = !!icon;
			self.visible = !!Hyprland.active.client.class;
		}
	});

// Not work for now since outdated workspace value

// export default (monitor?: number) =>
// 	Widget.Box({
// 		spacing: 8,
// 	}).hook(Hyprland, self => {
// 		const workspace = Hyprland.getWorkspace(Hyprland.getMonitor(monitor ?? 0)?.activeWorkspace.id as number);
// 		if (workspace?.lastwindow) {
// 			self.visible = workspace.lastwindow !== "0x0";

// 			const client = Hyprland.getClient(workspace.lastwindow);
// 			const entry = Applications.getEntry(client?.class ?? "");
// 			const icon = entry?.icon_name ?? "";
// 			const title = entry?.name ?? client?.title ?? "";
// 			self.children = [Widget.Icon({ size: 18, icon }), Widget.Label(title)];
// 			self.children[0].visible = !!icon;
// 		}
// 	});
