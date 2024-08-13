import Media from "@osd/overview/modules/media";

export default () =>
	Widget.Window({
		name: "overview",
		anchor: ["top"],
		visible: false,
		child: Widget.Box({
			children: [
				Widget.Calendar({ showWeekNumbers: true }),
				Widget.Separator({ vertical: true }),
				Widget.Box({ vertical: true, children: [Media()] }),
			],
		}),
	});
