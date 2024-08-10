import { position, duration, progress } from "@osd/overview/modules/progress";
import Mpris from "@services/mpris";
import image from "@lib/image";

const cover = (bus: string) =>
	Widget.Box({
		class_names: ["osd", "media", "image"],
		css: image({ path: Mpris.getPlayer(bus)?.cover_path, height: 94 }),
	});

const title = (bus: string) =>
	Widget.Label({
		truncate: "end",
		label: Mpris.getPlayer(bus)?.track_title,
	});

const media = () =>
	Widget.Box({
		class_names: ["osd", "media"],
	}).hook(
		Mpris,
		(self, bus) => {
			if (bus === undefined) bus = Mpris.getPlayer()?.bus_name;
			self.children = [
				cover(bus),
				Widget.Box({
					vertical: true,
					children: [
						title(bus),
						Widget.CenterBox({ start_widget: position(bus), center_widget: progress(bus), end_widget: duration(bus) }),
					],
				}),
			];
		},
		"player-changed",
	);

export default () =>
	Widget.Button({
		child: media(),
		on_clicked: () => (App.closeWindow("overview"), App.openWindow("media")),
	});
