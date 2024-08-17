import Hyprland from "@services/hyprland";
import hover from "@lib/hover";

const length = 10;

export default () =>
	Widget.EventBox({
		class_name: "workspaces",
		onScrollUp: () => Hyprland.changeWorkspace("+1"),
		onScrollDown: () => Hyprland.changeWorkspace("-1"),

		child: Widget.Box({
			children: [
				...Array.from({ length }, (_, id) => id + 1).map(id =>
					Widget.Button({
						class_name: Hyprland.active.workspace
							.bind("id")
							.as(active_id => `workspace ${active_id === id ? "focused" : "unfocused"}`),
						visible: Hyprland.bind("workspaces").as(workspace => workspace.some(workspace => workspace.id === id)),
						label: id.toString(),
						on_clicked: self => (Hyprland.changeWorkspace(id), (self.label = id.toString())),
						on_hover: self => Hyprland.monitors.length > 1 && id === Hyprland.active.workspace.id && (self.label = "󰯍"),
						setup: self => hover.off(self, () => (self.label = id.toString())),
					}),
				),
				Widget.Button({
					child: Widget.Label("+"),
					on_clicked: () => Hyprland.changeWorkspace("empty"),
				})
					.hook(Hyprland, self => (self.visible = !Hyprland.is_full(length)), "workspace-added")
					.hook(Hyprland, self => (self.visible = !Hyprland.is_full(length)), "workspace-removed"),
			],
		}),
	});
