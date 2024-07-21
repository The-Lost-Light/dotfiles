import { MprisPlayer } from "types/service/mpris";

export default (player: MprisPlayer) =>
	Widget.Label({
		class_names: ["media", "osd", "artist"],
		xalign: 0,
		label: player.track_artists.join(", "),
	});
