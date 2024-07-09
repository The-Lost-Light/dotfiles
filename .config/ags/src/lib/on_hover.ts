import { Gtk, AgsWidget } from "types";

export function on_hover(self: Gtk.Widget, callback: () => void) {
	(self as AgsWidget).on("enter-notify-event", self => (callback(), false));
}

export function on_hover_off(self: Gtk.Widget, callback: () => void) {
	(self as AgsWidget).on("leave-notify-event", self => (callback(), false));
}
