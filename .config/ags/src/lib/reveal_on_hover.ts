import hover from "@lib/hover";
import { Gtk, AgsRevealer } from "types";

export default function (hovered: Gtk.Widget, revealer: Gtk.Widget) {
	hover.on(hovered, () => ((revealer as AgsRevealer).reveal_child = true));
	hover.off(hovered, () => ((revealer as AgsRevealer).reveal_child = false));
}
