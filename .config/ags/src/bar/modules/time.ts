import time from "@lib/time";

export default () =>
	Widget.Box({
		children: [
			Widget.Label({
				class_name: "clock",
				label: time.bind().as(t => `${t.hour}:${t.minute}`),
			}),
			Widget.Revealer({
				transition: "slide_right",
				child: Widget.Label({
					label: time.bind().as(t => ` ${t.month}/${t.day}`),
				}),
			}),
		],
	});
