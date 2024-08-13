import { MprisPlayer } from "types";

const play_paulse = (player: MprisPlayer) =>
	Widget.Button({
		class_names: ["media", "osd", "play_paulse"],
		label: player.bind("play_back_status").as(status => (status === "Playing" ? "" : "")),
		on_clicked: () => player.playPause(),
	});

const previous = (player: MprisPlayer) =>
	Widget.Button({
		class_names: ["osd", "media", "previous"],
		label: "󰒮",
		on_clicked: () => player.previous(),
	});

const next = (player: MprisPlayer) =>
	Widget.Button({
		class_names: ["osd", "media", "next"],
		label: "󰒭",
		on_clicked: () => player.next(),
	});

export default { play_paulse, previous, next };
