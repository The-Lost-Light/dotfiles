const hyprland = await Service.import("hyprland");

const changeWorkspace = (ws: number | string) => hyprland.messageAsync(`dispatch workspace ${ws}`);

export default () =>
	Widget.EventBox({
		onScrollUp: () => changeWorkspace("+1"),
		onScrollDown: () => changeWorkspace("-1"),

		child: Widget.Box({
			class_name: "workspaces",
			children: Array.from({ length: 10 }, (_, id) => id + 1).map(id =>
				Widget.Button({
					class_name: hyprland.active.workspace
						.bind("id")
						.as(i => (i === id ? `workspace-${id} focused` : `workspace-${id} unfocused`)),
					visible: hyprland.bind("workspaces").as(ws => ws.some(ws => ws.id === id)),
					child: Widget.Label(id.toString()),
					on_clicked: () => changeWorkspace(id),
				}),
			),
		}),
	});
