import Applications from "@services/applications";
import image from "@widgets/image";
import time from "@lib/time";
import { MprisPlayer } from "types";

const cover = ({ player, height, ...rest }: { player: MprisPlayer; height: number; [key: string]: any }) =>
	Widget.Box({
		...rest,
	}).hook(player, self => (self.css = image({ path: player.cover_path, height })));

const icon = ({ player, ...rest }: { player: MprisPlayer; [key: string]: any }) =>
	Widget.Icon({ icon: player.bind("entry").as(entry => Applications.query(entry)[0].icon_name ?? ""), ...rest });

const title = ({ player, ...rest }: { player: MprisPlayer; [key: string]: any }) =>
	Widget.Label({
		truncate: "end",
		hpack: "start",
		hexpand: true,
		label: player.bind("track_title"),
		...rest,
	});

const artist = ({ player, ...rest }: { player: MprisPlayer; [key: string]: any }) =>
	Widget.Label({
		hpack: "start",
		label: player.bind("track_artists").as(artists => artists.join(", ")),
		...rest,
	});

const position = ({ player, ...rest }: { player: MprisPlayer; [key: string]: any }) =>
	Widget.Label({
		setup: self =>
			Utils.idle(() => {
				if (!self.is_destroyed) {
					let poll = false;
					const check = () => {
						if (player.position >= 0 && player.length > 0) {
							self.visible = true;
							if (poll === false) {
								poll = true;
								self.poll(1000, () => (self.label = time.format(player.position)));
							}
						} else self.visible = false;
					};
					self.hook(player, check);
					self.hook(player, check, "position");
				}
			}),
		...rest,
	});

const length = ({ player, ...rest }: { player: MprisPlayer; [key: string]: any }) =>
	Widget.Label({
		visible: Utils.merge(
			[player.bind("position"), player.bind("length")],
			(position, length) => position >= 0 && length > 0,
		),
		label: player.bind("length").as(length => time.format(length)),
		...rest,
	});

const progress = ({ player, width, ...rest }: { player: MprisPlayer; width: number; [key: string]: any }) =>
	Widget.LevelBar({
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
		...rest,
	});

export default { cover, icon, title, artist, position, length, progress };
