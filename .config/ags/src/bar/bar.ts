import Left from "@bar/left";
import Center from "@bar/center";
import Right from "@bar/right";

export default (monitor?: number) =>
	Widget.Window({
		name: `bar-${monitor}`,
		class_name: "bar",
		monitor,
		anchor: ["top", "left", "right"],
		exclusivity: "exclusive",
		child: Widget.CenterBox({
			start_widget: Left(),
			center_widget: Center(),
			end_widget: Right(),
		}),
	});
