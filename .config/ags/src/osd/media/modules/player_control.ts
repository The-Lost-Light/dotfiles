import { MprisPlayer } from "types";

export const play_paulse = (player: MprisPlayer) =>
	Widget.Button({
		class_names: ["media", "osd", "play_paulse"],
		label: player.bind("play_back_status").as(status => (status === "Playing" ? "" : "")),
		on_clicked: () => player.playPause(),
	});

export const previous_track = (player: MprisPlayer) =>
	Widget.Button({
		class_names: ["osd", "media", "previous"],
		label: "󰒮",
		on_clicked: () => player.previous(),
	});

export const next_track = (player: MprisPlayer) =>
	Widget.Button({
		class_names: ["osd", "media", "next"],
		label: "󰒭",
		on_clicked: () => player.next(),
	});
