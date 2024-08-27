import Hyprland from "@services/hyprland";
import hover from "@lib/hover";

const workspaces = (monitor?: number) => [
	...Hyprland.workspaces
		.flatMap(workspace => (workspace.id >= 0 ? workspace.id : []))
		.sort((i, j) => i - j)
		.map(id =>
			Widget.Button({
				class_name: "workspace",
				label: id.toString(),
				on_clicked: self => {
					Hyprland.changeWorkspace(id);
					self.label = id.toString();
				},
				on_hover: self => {
					if (Hyprland.monitors.length > 1 && id === Hyprland.active.workspace.id) self.label = "󰯍";
				},
				setup: self => hover.off(self, () => (self.label = id.toString())),
			}).hook(Hyprland.active, self => {
				self.toggleClassName("focused", id === Hyprland.getClient(Hyprland.active.client.address)?.workspace.id);
				self.toggleClassName("unmonitored", Hyprland.getWorkspace(id)?.monitorID !== monitor);
			}),
		),
	Widget.Button({
		child: Widget.Label("+"),
		on_clicked: () => Hyprland.changeWorkspace("emptym"),
		setup: self =>
			Utils.idle(() => {
				if (!self.is_destroyed) self.visible = !Hyprland.is_full(10);
			}),
	}),
];

export default (monitor?: number) =>
	Widget.EventBox({
		class_name: "workspaces",
		onScrollUp: () => Hyprland.changeWorkspace("m-1"),
		onScrollDown: () => Hyprland.changeWorkspace("m+1"),

		child: Widget.Box()
			.hook(Hyprland, self => (self.children = workspaces(monitor)), "workspace-added")
			.hook(Hyprland, self => (self.children = workspaces(monitor)), "workspace-removed"),
	});
