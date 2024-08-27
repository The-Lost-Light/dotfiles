import Hyprland from "@services/hyprland";
import initial from "@lib/initial";

import Bar from "@bar/bar";
import Corner from "corner";
import Osd from "@osd/osd";

export default App.config({
	windows: Hyprland.initialWindows([Bar, Corner, ...Osd]),
	onConfigParsed: () => initial.setScss("src/style", "style.scss"),
});
