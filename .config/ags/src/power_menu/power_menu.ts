const hyprland = await Service.import("hyprland");

import Logout from "./modules/logout";
import Poweroff from "./modules/poweroff";
import Reboot from "./modules/reboot";
import Sleep from "./modules/sleep";

export default () =>
  Widget.Window({
    name: "power_menu",
    class_name: "power_menu",
    visible: false,
    anchor: ["right"],
    monitor: hyprland.active.monitor.bind("id"),
    child: Widget.Box({
      vertical: true,
      children: [Logout(), Poweroff(), Reboot(), Sleep()],
    }),
  });
