const Hyprland = await Service.import("hyprland");

const changeWorkspace = (ws: number | string) => Hyprland.messageAsync(`dispatch workspace ${ws}`);

export default () =>
	Widget.EventBox({
		onScrollUp: () => changeWorkspace("+1"),
		onScrollDown: () => changeWorkspace("-1"),

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
						on_clicked: () => changeWorkspace(id),
					}),
				),
				Widget.Button({
					class_name: "new_workspace",
					child: Widget.Label("+"),
					visible: Hyprland.bind("workspaces")
						.as(ws => ws.map(ws => ws.id))
						.as(wsid => !Array.from({ length: 10 }, (_, id) => id + 1).every(id => wsid.includes(id))),
					on_clicked: () => Hyprland.messageAsync("dispatch workspace emptym"),
				}),
			],
		}),
	});
