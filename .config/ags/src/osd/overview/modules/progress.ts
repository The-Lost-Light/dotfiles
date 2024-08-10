import Mpris from "@services/mpris";
import minutes from "@lib/minutes";

export const position = (bus: string) =>
	Widget.Label({
		setup: self =>
			Utils.idle(() => {
				if (!self.is_destroyed) {
					let player = Mpris.getPlayer(bus);
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

export const duration = (bus: string) =>
	Widget.Label({
		label: minutes(Math.max(0, Mpris.getLength(Mpris.getPlayer(bus)))),
		setup: self =>
			Utils.idle(() => {
				if (!self.is_destroyed && Mpris.getLength(Mpris.getPlayer(bus)) === -1) self.visible = false;
			}),
	});

export const progress = (bus: string) =>
	Widget.LevelBar({
		"class-names": ["osd", "media", "progress"],
		widthRequest: 200,
		hpack: "center",
		vpack: "center",
		setup: self =>
			Utils.idle(() => {
				if (!self.is_destroyed) {
					let player = Mpris.getPlayer(bus);
					if (player)
						if (0 <= player.position && player.position <= Mpris.getLength(player)) {
							self.max_value = Mpris.getLength(player);
							const update = () => (self.value = Math.max(0, player.position));

							self.hook(player, update);
							self.hook(player, update, "position");
							self.poll(1000, update);
						} else self.visible = false;
				}
			}),
	});
