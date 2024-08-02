import Mpris from "@services/mpris";

export default () =>
	Widget.Label({
		class_name: "media",
	}).hook(
		Mpris,
		(self, bus) => {
			if (bus === undefined) bus = Mpris.getPlayer()?.bus_name;

			const player = Mpris.getPlayer(Mpris.getBus(bus));
			self.visible = Mpris.isPlayPause(player?.bus_name);
			self.label = Mpris.players.some(player => player.play_back_status === "Playing") ? " 󰎇" : " 󰎊";
		},
		"player-changed",
	);
