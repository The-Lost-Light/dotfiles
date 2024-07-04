import Icon from "types/widgets/icon";
import Label from "types/widgets/label";

import Hyprland from "@services/hyprland";

const Application = await Service.import("applications");

export const abc = () =>
	Widget.Label({
		class_name: "client-title",
		label: Hyprland.active
			.bind("client")
			.as(client => Application.query(client.class)[0]?.name ?? Hyprland.getClient(client.class)),
	});

export default () =>
	Widget.Box({
		class_name: "client-title",
		spacing: 4,
		children: [Widget.Icon(), Widget.Label()],
	}).hook(Hyprland.active.client, self => {
		const wmclass = Hyprland.active.client.class;
		const entry = Application.query(wmclass)[0];
		(self.children[0] as Icon<unknown>).icon = entry?.icon_name ?? "";
		(self.children[1] as Label<unknown>).label = entry?.name ?? Hyprland.getClient(wmclass) ?? "";
		if ((self.children[1] as Label<unknown>).label === "") self.visible = false;
	});
