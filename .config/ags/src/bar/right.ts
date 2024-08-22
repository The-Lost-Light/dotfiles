import Net from "@bar/modules/net_speed";
import Battery from "@bar/modules/battery";
import Backlight from "@bar/modules/backlight";
import Volume from "@bar/modules/audio";
import SystemTray from "@bar/modules/system_tray";
import Coffee from "@bar/modules/coffee";

export default () =>
	Widget.Box({
		class_name: "right",
		hpack: "end",
		spacing: 8,
		children: [Net(), Battery(), Backlight(), Volume(), SystemTray(), Coffee()],
	});
