import Gtk from "types/@girs/gtk-3.0/gtk-3.0";

import Hyprland from "@services/hyprland";

import Bar from "@bar/bar";
import Powermenu from "@osd/power_menu";
import Media from "@osd/media";
import Notification from "@osd/notifications";

const scss = App.configDir + "/src/style/style.scss";
const css = "/tmp/ags/style.css";

const createWindows = () =>
	[...Hyprland.monitors.map(m => Bar(m.id)), Powermenu() /* , Notification() */, Media()].map(w =>
		w.on("destroy", (self: Gtk.Window) => App.removeWindow(self)),
	);

const recreateWindows = () => {
	for (const win of App.windows) {
		App.removeWindow(win);
	}
	App.config({ windows: createWindows() });
};

const applyCss = () =>
	Utils.exec(
		`sassc ${scss} ${css}`,
		() => (App.resetCss(), App.applyCss(css)),
		err => print(err),
	);

export default App.config({
	windows: createWindows(),
	onConfigParsed: () => {
		Hyprland.connect("monitor-removed", recreateWindows);
		Hyprland.connect("monitor-added", recreateWindows);

		applyCss();
		Utils.monitorFile(`${App.configDir}/src/style`, applyCss);
	},
});
