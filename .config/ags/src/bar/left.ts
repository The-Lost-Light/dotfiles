import Launcher from "@bar/modules/launcher";
import Workspaces from "@bar/modules/workspaces";
import Title from "@bar/modules/title";

export default (monitor?: number) =>
	Widget.Box({
		class_name: "left",
		spacing: 8,
		children: [Launcher(), Workspaces(monitor), Title(monitor)],
	});
