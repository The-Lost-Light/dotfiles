import Mpris from "@services/mpris";
import media from "@widgets/media";
import card from "@osd/media/modules/card";

let current_track = -1;

export default () =>
	Widget.Button({
		child: Widget.Box({ class_names: ["osd", "media"] }),
		on_clicked: () => {
			App.closeWindow("overview");
			if (current_track >= 0) card.shown.value = current_track;
			App.openWindow("media");
		},
	}).hook(
		Mpris,
		(self, bus) => {
			if (!bus) bus = Mpris.getPlayer()?.bus_name ?? "";

			let player = Mpris.getRealPlayer(bus);
			if (player && player.identity) {
				self.child.children = [
					media.cover({ player, height: 94, class_name: "cover" }),
					Widget.Box({
						vertical: true,
						children: [
							media.title({ player }),
							Widget.CenterBox({
								start_widget: media.position({ player }),
								center_widget: media.progress({ player, width: 200, class_name: "progress" }),
								end_widget: media.duration({ player }),
							}),
						],
					}),
				];
				current_track = Mpris.getIndex(player);
				self.visible = true;
			} else {
				self.visible = false;
				current_track = -1;
				self.child.children = [];
			}
		},
		"player-changed",
	);
