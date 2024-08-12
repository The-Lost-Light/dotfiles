import media from "@widgets/media";
import Mpris from "@services/mpris";

export default () =>
	Widget.Button({
		child: Widget.Box({
			class_names: ["osd", "media"],
		}).hook(
			Mpris,
			(self, bus) => {
				if (bus === undefined) bus = Mpris.getPlayer()?.bus_name;
				let player = Mpris.getPlayer(Mpris.getBus(bus));
				if (player)
					self.children = [
						media.cover({ player, height: 94 }),
						Widget.Box({
							vertical: true,
							children: [
								media.title({ player }),
								Widget.CenterBox({
									start_widget: media.position({ player }),
									center_widget: media.progress({ player, width: 200, "class-names": ["osd", "media", "progress"] }),
									end_widget: media.duration({ player }),
								}),
							],
						}),
					];
				else self.children = [];
			},
			"player-changed",
		),
		on_clicked: () => (App.closeWindow("overview"), App.openWindow("media")),
	});
