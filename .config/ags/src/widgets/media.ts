import image from "@widgets/image";
import minutes from "@lib/minutes";
import { MprisPlayer } from "types";

const cover = ({ player, height, ...rest }: { player: MprisPlayer; height: number; [key: string]: any }) =>
	Widget.Box({
		...rest,
	}).hook(player, self => (self.css = image({ path: player.cover_path, height })));

const title = ({ player, ...rest }: { player: MprisPlayer; [key: string]: any }) =>
	Widget.Label({
		...rest,
		truncate: "end",
		hpack: "start",
		hexpand: true,
		label: player.bind("track_title"),
	});

const artist = ({ player, ...rest }: { player: MprisPlayer; [key: string]: any }) =>
	Widget.Label({
		...rest,
		hpack: "start",
		label: player.bind("track_artists").as(artists => artists.join(", ")),
	});

const position = ({ player, ...rest }: { player: MprisPlayer; [key: string]: any }) =>
	Widget.Label({
		...rest,
		setup: self =>
			Utils.idle(() => {
				if (!self.is_destroyed) {
					let poll = false;
					const check = () => {
						if (player.position >= 0 && player.length > 0) {
							self.visible = true;
							if (poll === false) {
								poll = true;
								self.poll(1000, () => (self.label = minutes(player.position)));
							}
						} else self.visible = false;
					};
					self.hook(player, check);
					self.hook(player, check, "position");
				}
			}),
	});

const duration = ({ player, ...rest }: { player: MprisPlayer; [key: string]: any }) =>
	Widget.Label({
		...rest,
		visible: player.bind("length").as(length => length > 0),
		label: player.bind("length").as(length => minutes(length)),
	});

const progress = ({ player, width, ...rest }: { player: MprisPlayer; width: number; [key: string]: any }) =>
	Widget.LevelBar({
		...rest,
		widthRequest: width,
		hpack: "center",
		setup: self =>
			Utils.idle(() => {
				if (!self.is_destroyed) {
					let poll = false;
					const check = () => {
						if (0 <= player.position && player.position < player.length) {
							self.visible = true;
							if (poll === false) {
								poll = true;
								self.max_value = player.length;
								self.poll(1000, () => (self.value = player.position));
							}
						} else self.visible = false;
					};
					self.hook(player, check);
					self.hook(player, check, "position");
				}
			}),
	});

export default { cover, title, artist, position, duration, progress };
