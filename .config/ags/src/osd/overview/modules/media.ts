import { position, duration, progress } from "@osd/overview/modules/progress";
import Mpris from "@services/mpris";
import image from "@lib/image";
import { MprisPlayer } from "types";

const cover = (player: MprisPlayer) =>
	Widget.Box({
		class_names: ["osd", "media", "image"],
		css: image({ path: player.cover_path, height: 94 }),
	});

const title = (player: MprisPlayer) =>
	Widget.Label({
		truncate: "end",
		label: player.track_title,
	});

const media = () =>
	Widget.Box({
		class_names: ["osd", "media"],
	}).hook(
		Mpris,
		(self, bus) => {
			if (bus === undefined) bus = Mpris.getPlayer()?.bus_name;
			let player = Mpris.getPlayer(bus);
			if (player)
				self.children = [
					cover(player),
					Widget.Box({
						vertical: true,
						children: [
							title(player),
							Widget.CenterBox({
								start_widget: position(player),
								center_widget: progress(player),
								end_widget: duration(player),
							}),
						],
					}),
				];
			else self.children = [];
		},
		"player-changed",
	);

export default () =>
	Widget.Button({
		child: media(),
		on_clicked: () => (App.closeWindow("overview"), App.openWindow("media")),
	});
