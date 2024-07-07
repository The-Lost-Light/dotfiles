import Hyprland from "@services/hyprland";
import setScss from "@lib/set_scss";

import Bar from "@bar/bar";
import Osd from "@osd/osd";

export default App.config({
	windows: Hyprland.initialWindows([Bar, ...Osd]),
	onConfigParsed: () => setScss("src/style", "style.scss"),
});
