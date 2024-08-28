export default (monitor?: number) =>
	Widget.Window({
		name: `corner-${monitor}`,
		class_name: "corner",
		monitor,
		anchor: ["top", "bottom", "right", "left"],
		click_through: true,
		child: Widget.Box({
			class_name: "hole",
			child: Widget.Box({
				class_name: "filler",
				expand: true,
			}),
		}),
	});
