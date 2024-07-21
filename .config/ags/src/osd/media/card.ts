import Mpris from "@services/mpris";

import cover from "@osd/media/modules/cover";
import title from "@osd/media/modules/title";
import artist from "@osd/media/modules/artist";
import position from "@osd/media/modules/position";
import duration from "@osd/media/modules/duration";
import progress from "@osd/media/modules/progress";

import { MprisPlayer } from "types/service/mpris";

export const shown = Variable(0);

export default (player: MprisPlayer, index: number, length: number) => {
	if (Mpris.isPlayerctld(player.bus_name)) return [];

	const left_card =
		index > 0
			? Widget.Button({
					class_names: ["media", "osd", "left"],
					label: "",
					on_clicked: () => --shown.value,
				})
			: Widget.Box({ class_names: ["media", "osd", "left"] });
	const right_card =
		index < length - 1
			? Widget.Button({
					class_names: ["media", "osd", "right"],
					label: "",
					on_clicked: () => ++shown.value,
				})
			: Widget.Box({ class_names: ["media", "osd", "right"] });

	const play_paulse = Widget.Button({
		class_names: ["media", "osd", "play_paulse"],
		label: player?.play_back_status === "Playing" ? "" : "",
		on_clicked: () => player.playPause(),
	});
	const previous_track = Widget.Button({
		class_names: ["media", "osd", "previous"],
		label: "󰒮",
		on_clicked: () => player.previous(),
	});
	const next_track = Widget.Button({
		class_names: ["media", "osd", "next"],
		label: "󰒭",
		on_clicked: () => player.next(),
	});

	return Widget.Box({
		class_names: ["media", "osd"],
		children: [
			cover(player),
			Widget.Box({
				class_names: ["media", "osd", "info"],
				vertical: true,
				children: [
					Widget.Box([title(player), left_card, right_card]),
					artist(player),
					Widget.CenterBox({ center_widget: Widget.Box([previous_track, play_paulse, next_track]) }),
					Widget.Box([position(player), progress(player), duration(player)]),
				],
			}),
		],
	});
};
