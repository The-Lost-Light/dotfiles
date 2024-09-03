export default (monitor?: number) =>
	Widget.Window({
		name: `corner-${monitor}`,
		class_name: "corner",
		monitor,
		anchor: ["top", "bottom", "right", "left"],
		click_through: true,
		child: Widget.Box({
			class_name: "shadow",
			child: Widget.Box({
				class_name: "border",
				expand: true,
				child: Widget.Box({
					class_name: "padding",
					expand: true,
				}),
			}),
		}),
	});
