const date = Variable([], {
	poll: [1000, 'date "+%H:%M %-m/%-d"', out => out.split(" ")],
});

export default () =>
	Widget.Box({
		children: [
			Widget.Label({
				class_name: "clock",
				label: date.bind().as(v => v[0]),
			}),
			Widget.Revealer({
				transition: "slide_right",
				child: Widget.Label({
					label: date.bind().as(v => ` ${v[1]}`),
				}),
			}),
		],
	});
