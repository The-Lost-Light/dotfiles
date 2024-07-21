import { MprisPlayer } from "types/service/mpris";

export default (player: MprisPlayer) =>
	Widget.Label({
		class_names: ["media", "osd", "title"],
		xalign: 0,
		hexpand: true,
		label: player.track_title,
	});
