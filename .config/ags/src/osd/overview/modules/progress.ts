import Mpris from "@services/mpris";
import minutes from "@lib/minutes";
import { MprisPlayer } from "types";

export const position = (player: MprisPlayer) =>
	Widget.Label({
		setup: self =>
			Utils.idle(() => {
				if (!self.is_destroyed && (player?.length ?? -1) > 0) {
					if (player)
						if (player.position >= 0) {
							const update = () => (self.label = minutes(Math.max(0, player.position)));

							self.hook(player, update);
							self.hook(player, update, "position");
							self.poll(1000, update);
						} else self.visible = false;
				}
			}),
	});

export const duration = (player: MprisPlayer) =>
	Widget.Label({
		label: minutes(player.length),
		setup: self =>
			Utils.idle(() => {
				if (!self.is_destroyed && !(player.length > 0)) self.visible = false;
			}),
	});

export const progress = (player: MprisPlayer) =>
	Widget.LevelBar({
		"class-names": ["osd", "media", "progress"],
		widthRequest: 200,
		hpack: "center",
		vpack: "center",
		setup: self =>
			Utils.idle(() => {
				if (!self.is_destroyed) {
					if (player)
						if (0 <= player.position && player.position < player.length) {
							self.max_value = player.length;
							const update = () => (self.value = Math.max(0, player.position));

							self.hook(player, update);
							self.hook(player, update, "position");
							self.poll(1000, update);
						} else self.visible = false;
				}
			}),
	});
