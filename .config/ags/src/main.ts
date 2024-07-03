import Hyprland from "@services/hyprland";
import setScss from "@lib/set_scss";

import Bar from "@bar/bar";
import Powermenu from "@osd/power_menu";

export default App.config({
	windows: Hyprland.initialWindows([Bar, Powermenu]),
	onConfigParsed: () => setScss({ directory: "src/style", entry: "style.scss" }),
});
