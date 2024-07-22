export const shown = Variable(0);

export const left_card = (index: number) =>
	index > 0
		? Widget.Button({
				class_names: ["osd", "media", "left"],
				label: "",
				on_clicked: () => --shown.value,
			})
		: Widget.Box({ class_names: ["media", "osd", "left"] });

export const right_card = (index: number, length: number) =>
	index < length - 1
		? Widget.Button({
				class_names: ["osd", "media", "right"],
				label: "",
				on_clicked: () => ++shown.value,
			})
		: Widget.Box({ class_names: ["osd", "media", "right"] });
