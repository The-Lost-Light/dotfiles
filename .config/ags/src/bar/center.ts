import Indicator from "@bar/modules/arch_updates";
import Weather from "@bar/modules/weather";
import Time from "@bar/modules/time";
import Media from "@bar/modules/media";
import PowerButton from "@bar/modules/power_button";
import hover from "@lib/hover";
import { AgsBox } from "types";

const Center = () =>
	Widget.Button({
		child: Widget.Box([Weather(), Time(), Media()]),
		on_clicked: () => {
			if (App.getWindow("overview")?.visible) {
				App.closeWindow("overview");
			} else if (App.getWindow("media")?.visible) {
				App.closeWindow("media");
			} else {
				App.openWindow("overview");
			}
		},
		setup: self => hover.reveal(self, (self.child.children[1] as AgsBox).children[1]),
	});

export default () =>
	Widget.Box({
		class_name: "center",
		children: [Indicator(), Center(), PowerButton()],
	});
