import Mpris from "@services/mpris";
import setCards from "@osd/media/modules/cards";

export default () =>
	Widget.Window({
		name: "media",
		class_name: "media",
		anchor: ["top"],
		visible: false,
		child: Widget.Stack({
			class_names: ["osd", "media"],
			homogeneous: false,
			transition: "slide_left_right",
			transition_duration: 600,
		})
			.hook(Mpris, (self, bus) => setCards(self, bus), "player-added")
			.hook(Mpris, (self, bus) => setCards(self, bus), "player-closed"),
	});
