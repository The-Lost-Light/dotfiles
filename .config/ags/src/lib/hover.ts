import { Gtk, AgsWidget } from "types";

function on(self: Gtk.Widget, callback: () => void) {
	(self as AgsWidget).on("enter-notify-event", () => (callback(), false));
}

function off(self: Gtk.Widget, callback: () => void) {
	(self as AgsWidget).on("leave-notify-event", () => (callback(), false));
}

export default { on, off };
