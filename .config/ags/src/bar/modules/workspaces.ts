import Hyprland from "@services/hyprland";

export default () =>
	Widget.EventBox({
		onScrollUp: () => Hyprland.changeWorkspace("+1"),
		onScrollDown: () => Hyprland.changeWorkspace("-1"),

		child: Widget.Box({
			class_name: "workspaces",
			children: [
				...Array.from({ length: 10 }, (_, id) => id + 1).map(id =>
					Widget.Button({
						class_name: Hyprland.active.workspace
							.bind("id")
							.as(ai => `workspace-${id} ${ai === id ? "focused" : "unfocused"}`),
						visible: Hyprland.bind("workspaces").as(ws => ws.some(ws => ws.id === id)),
						child: Widget.Label(id.toString()),
						on_clicked: self => (Hyprland.changeWorkspace(id), (self.child.label = id.toString())),
						on_hover: self => id === Hyprland.active.workspace.id && (self.child.label = ""),
					}).on("leave-notify-event", self => (self.child.label = id.toString()) && null),
				),
				Widget.Button({
					class_name: "new_workspace",
					child: Widget.Label("+"),
					visible: Hyprland.bind("is_full"),
					on_clicked: () => Hyprland.createNewWorkspace(),
				}),
			],
		}),
	});
