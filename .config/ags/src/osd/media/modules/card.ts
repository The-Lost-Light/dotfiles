import media from "@widgets/media";
import { play_paulse, previous_track, next_track } from "@osd/media/modules/player_control";
import { left_card, right_card } from "@osd/media/modules/cards_control";
import { MprisPlayer } from "types";

export default (player: MprisPlayer, index: number, length: number) =>
	Widget.Box({
		class_names: ["osd", "media"],
		children: [
			media.cover({ player, height: 188, class_names: ["osd", "media", "image"] }),
			Widget.Box({
				class_names: ["osd", "media", "info"],
				vertical: true,
				children: [
					Widget.Box({
						vertical: true,
						children: [
							Widget.Box([
								media.title({ player, class_names: ["osd", "media", "title"] }),
								left_card(index),
								right_card(index, length),
							]),
							media.artist({ player, class_names: ["osd", "media", "artist"] }),
						],
					}),
					Widget.Box({ vexpand: true }),
					Widget.CenterBox({
						class_names: ["osd", "media", "control", "player"],
						start_widget: media.position({ player }),
						center_widget: Widget.Box({
							spacing: 4,
							children: [previous_track(player), play_paulse(player), next_track(player)],
						}),
						end_widget: media.duration({ player }),
					}),
					media.progress({ player, width: 300, class_names: ["osd", "media", "progress"] }),
				],
			}),
		],
	});
