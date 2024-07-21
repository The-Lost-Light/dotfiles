import { MprisPlayer } from "types/service/mpris";

export default (player: MprisPlayer) =>
	Widget.ProgressBar({
		hexpand: true,
		setup: self => {
			Utils.idle(() => {
				if (!self.is_destroyed)
					if (0 <= player.position && player.position <= player.length) {
						const update = () => (self.value = player.position / player.length);

						self.hook(player, update);
						self.hook(player, update, "position");
						self.poll(1000, update);
					} else self.visible = false;
			});
		},
	});
