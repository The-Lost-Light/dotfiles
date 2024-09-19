import { Gtk, AgsWidget, AgsRevealer } from "types";

function on(self: Gtk.Widget, callback: () => void) {
	(self as AgsWidget).on("enter-notify-event", () => (callback(), false));
}

function off(self: Gtk.Widget, callback: () => void) {
	(self as AgsWidget).on("leave-notify-event", () => (callback(), false));
}

function reveal(hovered: Gtk.Widget, revealer: Gtk.Widget) {
	on(hovered, () => ((revealer as AgsRevealer).reveal_child = true));
	off(hovered, () => ((revealer as AgsRevealer).reveal_child = false));
}

export default { on, off, reveal };
