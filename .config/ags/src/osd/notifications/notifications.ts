const Notifications = await Service.import("notifications");
import Image from "@widgets/image";

const list = Notifications.bind("popups").as(p =>
	p.map(notify => {
		const icon = Widget.Box(
			(() => {
				if (notify.image) return Image({ path: notify.image });
				else if (Utils.lookUpIcon(notify.app_entry)) return Widget.Icon(notify.app_entry);
				else if (Utils.lookUpIcon(notify.app_icon)) return Widget.Icon(notify.app_icon);
				else return Widget.Icon("dialog-information-symbolic");
			})(),
		);

		const title = Widget.Label({
			label: notify.summary,
			justification: "left",
			max_width_chars: 24,
			truncate: "end",
			wrap: true,
			use_markup: true,
		});

		const body = Widget.Label({
			label: notify.body,
			justification: "left",
			wrap: true,
			use_markup: true,
		});

		const actions = Widget.Box({
			children: notify.actions.map(({ id, label }) =>
				Widget.Button({
					child: Widget.Label(label),
					hexpand: true,
					on_clicked: () => (notify.invoke(id), notify.dismiss),
				}),
			),
		});

		return Widget.EventBox(
			{ on_primary_click: notify.dismiss },
			Widget.Box({ vertical: true }, Widget.Box(icon, Widget.Box({ vertical: true }, title, body)), actions),
		);
	}),
);

export default () =>
	Widget.Window(
		{
			name: "notifications",
			anchor: ["top", "right"],
			visible: Notifications.bind("popups").as(p => !!p.length),
		},
		Widget.Box({
			children: list,
			vertical: true,
		}),
	);
