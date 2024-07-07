import { agsWidget, gtkWidget } from "types";

export function on_hover(self: agsWidget | gtkWidget, callback: () => void) {
	(self as agsWidget).on("enter-notify-event", self => (callback(), false));
}

export function on_hover_off(self: agsWidget | gtkWidget, callback: () => void) {
	(self as agsWidget).on("leave-notify-event", self => (callback(), false));
}
