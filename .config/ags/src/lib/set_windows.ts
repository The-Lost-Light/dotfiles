import Gtk from "types/@girs/gtk-3.0/gtk-3.0";
import Window from "types/widgets/window";

import Hyprland from "@services/hyprland";

type agsWindow = Window<Gtk.Widget, unknown>;
type fixed = ((id?: number) => agsWindow)[];
type osd = (() => agsWindow)[];

export const createFixedWindows = (windows: fixed) =>
	Hyprland.monitors
		.flatMap(monitor => windows.map(window => window(monitor.id)))
		.map(window => window.on("destroy", (self: agsWindow) => App.removeWindow(self)));

export const createOsdWindows = (windows: osd) =>
	windows.map(window => window().on("delete-event", (self: agsWindow) => (self.hide(), true)));

export const recreateWindows = (windows: fixed) => {
	App.windows.forEach(window => {
		if (window["monitor"] !== undefined) App.removeWindow(window);
	});

	App.config({ windows: createFixedWindows(windows) });
};

export const initialWindows = ({ fixedWindows, osdWindows }) => {
	toggleMonitorWindows(fixedWindows);
	return [...createFixedWindows(fixedWindows), ...createOsdWindows(osdWindows)];
};

export const toggleMonitorWindows = (fixedWindows: fixed) => {
	Hyprland.connect("monitor-removed", () => recreateWindows(fixedWindows));
	Hyprland.connect("monitor-added", () => recreateWindows(fixedWindows));
};

export default initialWindows;
