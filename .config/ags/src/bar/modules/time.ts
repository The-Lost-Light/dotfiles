import reveal_on_hover from "@lib/reveal_on_hover";

const date = Variable([], {
	poll: [1000, 'date "+%H:%M %-m/%-d"', out => out.split(" ")],
});

export default () =>
	Widget.Box({
		class_name: "time",
		children: [
			Widget.EventBox({
				class_name: "clock",
				child: Widget.Label({
					label: date.bind().as(v => v[0]),
				}),
			}),
			Widget.Revealer({
				class_name: "date",
				transition: "slide_right",
				child: Widget.Label({
					label: date.bind().as(v => ` ${v[1]}`),
				}),
			}),
		],
		setup: self => reveal_on_hover(self.children[0], self.children[1]),
	});
