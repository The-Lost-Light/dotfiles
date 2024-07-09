import { Gtk, AgsRevealer } from "types";

import { on_hover, on_hover_off } from "@lib/on_hover";

export default function (hovered: Gtk.Widget, revealer: Gtk.Widget) {
	on_hover(hovered, () => ((revealer as AgsRevealer).reveal_child = true));
	on_hover_off(hovered, () => ((revealer as AgsRevealer).reveal_child = false));
}
