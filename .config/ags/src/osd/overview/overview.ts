import Media from "@osd/overview/modules/media";

export default () =>
	Widget.Window({
		name: "overview",
		class_name: "overview",
		anchor: ["top"],
		visible: false,
		child: Widget.Box({
			spacing: 16,
			children: [
				Widget.Calendar({ class_name: "calendar", showWeekNumbers: true }),
				Widget.Separator({ vertical: true }),
				Widget.Box({ vertical: true, children: [Media()] }),
			],
		}),
	});
