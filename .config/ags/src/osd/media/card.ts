import cover from "@osd/media/modules/cover";
import { title, artist } from "@osd/media/modules/track";
import { position, duration, progress } from "@osd/media/modules/progress";
import { left_card, right_card } from "@osd/media/modules/cards_control";
import { play_paulse, previous_track, next_track } from "@osd/media/modules/player_control";

import { MprisPlayer } from "types";

export default (player: MprisPlayer, index: number, length: number) =>
	Widget.Box({
		class_names: ["osd", "media"],
		children: [
			cover(player),
			Widget.Box({
				class_names: ["osd", "media", "info"],
				vertical: true,
				children: [
					Widget.Box({
						vertical: true,
						children: [Widget.Box([title(player), left_card(index), right_card(index, length)]), artist(player)],
					}),
					Widget.Box({ vexpand: true }),
					Widget.CenterBox({
						class_names: ["osd", "media", "control", "player"],
						start_widget: position(player),
						center_widget: Widget.Box([previous_track(player), play_paulse(player), next_track(player)]),
						end_widget: duration(player),
					}),
					progress(player),
				],
			}),
		],
	});
