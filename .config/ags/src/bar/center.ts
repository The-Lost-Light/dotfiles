import Indicator from "@bar/modules/arch_updates";
import Weather from "@bar/modules/weather";
import Time from "@bar/modules/time";
import Media from "@bar/modules/media";
import PowerButton from "@bar/modules/power_button";

import reveal_on_hover from "@lib/reveal_on_hover";

import { AgsBox } from "types";

const Center = () =>
	Widget.Button({
		child: Widget.Box([Weather(), Time(), Media()]),
		on_clicked: () => App.toggleWindow("media"),
		setup: self => reveal_on_hover(self, (self.child.children[1] as AgsBox).children[1]),
	});

export default () =>
	Widget.Box({
		class_name: "center",
		children: [Indicator(), Center(), PowerButton()],
	});
