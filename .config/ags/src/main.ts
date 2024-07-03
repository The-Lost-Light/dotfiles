import initialWindows from "@lib/set_windows";
import setScss from "@lib/set_scss";

import Bar from "@bar/bar";
import Powermenu from "@osd/power_menu";

const fixedWindows = [Bar];
const osdWindows = [Powermenu];

export default App.config({
	windows: initialWindows({ fixedWindows, osdWindows }),
	onConfigParsed: () => setScss({ directory: "src/style", entry: "style.scss" }),
});
