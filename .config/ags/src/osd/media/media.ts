import setCards from "@osd/media/cards";

export default () =>
	Widget.Window({
		name: "media",
		anchor: ["top"],
		visible: false,
		child: setCards(),
	});
