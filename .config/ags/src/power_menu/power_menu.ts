import Logout from "@power_menu/modules/logout";
import Poweroff from "@power_menu/modules/poweroff";
import Reboot from "@power_menu/modules/reboot";
import Sleep from "@power_menu/modules/sleep";

export default () =>
	Widget.Window({
		name: "power_menu",
		class_name: "power_menu",
		visible: false,
		anchor: ["right"],
		child: Widget.Box({
			vertical: true,
			children: [Logout(), Poweroff(), Reboot(), Sleep()],
		}),
	});
