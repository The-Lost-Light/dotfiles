import { gtkWidget, revealer } from "types";

import { on_hover, on_hover_off } from "@lib/on_hover";

export default function (hovered: gtkWidget, revealer: gtkWidget) {
	on_hover(hovered, () => ((revealer as revealer).reveal_child = true));
	on_hover_off(hovered, () => ((revealer as revealer).reveal_child = false));
}
