import { MprisPlayer } from "types";

export const title = (player: MprisPlayer) =>
	Widget.Label({
		class_names: ["osd", "media", "title"],
		truncate: "end",
		hpack: "start",
		hexpand: true,
		label: player.bind("track_title"),
	});

export const artist = (player: MprisPlayer) =>
	Widget.Label({
		class_names: ["osd", "media", "artist"],
		hpack: "start",
		label: player.bind("track_artists").as(artists => artists.join(", ")),
	});
