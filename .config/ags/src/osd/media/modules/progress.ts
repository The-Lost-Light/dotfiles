import Mpris from "@services/mpris";
import minutes from "@lib/minutes";

import { MprisPlayer } from "types";

export const position = (player: MprisPlayer) =>
	Widget.Label({
		setup: self =>
			Utils.idle(() => {
				if (!self.is_destroyed)
					if (player.position >= 0) {
						const update = () => (self.label = minutes(Math.max(0, player.position)));

						self.hook(player, update);
						self.hook(player, update, "position");
						self.poll(1000, update);
					} else self.visible = false;
			}),
	});

export const duration = (player: MprisPlayer) =>
	Widget.Label({
		label: minutes(Math.max(0, Mpris.getLength(player))),
		setup: self =>
			Utils.idle(() => {
				if (!self.is_destroyed && Mpris.getLength(player) === -1) self.visible = false;
			}),
	});

export const progress = (player: MprisPlayer) =>
	Widget.LevelBar({
		"class-names": ["osd", "media", "progress"],
		widthRequest: 250,
		vpack: "center",
		setup: self =>
			Utils.idle(() => {
				if (!self.is_destroyed)
					if (0 <= player.position && player.position <= Mpris.getLength(player)) {
						self.max_value = Mpris.getLength(player);
						const update = () => (self.value = Math.max(0, player.position));

						self.hook(player, update);
						self.hook(player, update, "position");
						self.poll(1000, update);
					} else self.visible = false;
			}),
	});
