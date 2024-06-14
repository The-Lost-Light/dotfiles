import Launcher from "./modules/launcher";
import Workspaces from "./modules/workspaces";
import ClientTitle from "./modules/title";

import Indicator from "./modules/arch_updates";
import Clock from "./modules/clock";
import PowerButton from "./modules/power_button";
import Notification from "./modules/notifications";
import Media from "./modules/media";

import Net from "./modules/net_speed";
import Battery from "./modules/battery";
import Backlight from "./modules/backlight";
import Volume from "./modules/audio";
import SystemTray from "./modules/system_tray";

print(Net);

const Left = () =>
	Widget.Box({
		spacing: 8,
		children: [Launcher(), Workspaces(), ClientTitle()],
	});

const Center = () =>
	Widget.Box({
		spacing: 8,
		children: [
			Indicator(),
			Clock(),
			PowerButton(),
			// Notification(),
			// Media(),
		],
	});

const Right = () =>
	Widget.Box({
		hpack: "end",
		spacing: 8,
		children: [Battery(), Backlight(), Volume(), SystemTray()],
	});

export default (monitor = 0) =>
	Widget.Window({
		name: `bar-${monitor}`,
		class_name: "bar",
		monitor,
		// visible: false,
		anchor: ["top", "left", "right"],
		exclusivity: "exclusive",
		child: Widget.CenterBox({
			start_widget: Left(),
			center_widget: Center(),
			end_widget: Right(),
		}),
	});
