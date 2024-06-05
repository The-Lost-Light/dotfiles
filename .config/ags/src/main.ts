import Gtk from "types/@girs/gtk-3.0/gtk-3.0";

const hyprland = await Service.import("hyprland");

import Bar from "./bar/bar";
import Powermenu from "./power_menu/power_menu";

const scss = App.configDir + "/style/style.scss";
const css = `/tmp/ags/style.css`;
Utils.exec(`sassc ${scss} ${css}`);

const createWindows = () =>
	[
		...Array.from({ length: hyprland.monitors.length }, (_, id) => Bar(id)),
		Powermenu(),
	].map(w => w.on("destroy", (self: Gtk.Window) => App.removeWindow(self)));

const recreateWindows = () => {
	for (const win of App.windows) {
		App.removeWindow(win);
	}
	App.config({ windows: createWindows() });
};

export default App.config({
	style: css,
	windows: createWindows(),
	onConfigParsed: () => {
		hyprland.connect("monitor-removed", () => recreateWindows());
		hyprland.connect("monitor-added", recreateWindows);
	},
});
