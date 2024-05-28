const hyprland = await Service.import("hyprland");

import Bar from "./bar/bar";
import Powermenu from "./power_menu/power_menu";

const scss = App.configDir + "/style/style.scss";
const css = `/tmp/ags/style.css`;
Utils.exec(`sassc ${scss} ${css}`);

export default App.config({
  style: css,
  // windows: [Bar(0), Bar(1), Powermenu(hyprland.active.monitor.id)],
  windows: [Powermenu()],
});
