import Launcher from "@bar/modules/launcher";
import Workspaces from "@bar/modules/workspaces";
import ClientTitle from "@bar/modules/title";

export default () =>
	Widget.Box({
		class_name: "left",
		spacing: 8,
		children: [Launcher(), Workspaces(), ClientTitle()],
	});
