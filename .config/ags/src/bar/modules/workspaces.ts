import Hyprland from "@services/hyprland";
import { on_hover_off } from "@lib/on_hover";

export default () =>
	Widget.EventBox({
		class_name: "workspaces",
		onScrollUp: () => Hyprland.changeWorkspace("+1"),
		onScrollDown: () => Hyprland.changeWorkspace("-1"),

		child: Widget.Box({
			children: [
				...Array.from({ length: 10 }, (_, id) => id + 1).map(id =>
					Widget.Button({
						class_name: Hyprland.active.workspace
							.bind("id")
							.as(ai => `workspace ${ai === id ? "focused" : "unfocused"}`),
						visible: Hyprland.bind("workspaces").as(ws => ws.some(ws => ws.id === id)),
						label: id.toString(),
						on_clicked: self => (Hyprland.changeWorkspace(id), (self.label = id.toString())),
						on_hover: self => Hyprland.monitors.length > 1 && id === Hyprland.active.workspace.id && (self.label = "󰯍"),
						setup: self => on_hover_off(self, () => (self.label = id.toString())),
					}),
				),
				Widget.Button({
					child: Widget.Label("+"),
					visible: Hyprland.bind("is_full"),
					on_clicked: () => Hyprland.createNewWorkspace(),
				}),
			],
		}),
	});
