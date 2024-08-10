import Mpris from "@services/mpris";

export default () =>
	Widget.Label({
		class_name: "media",
	}).hook(
		Mpris,
		self => {
			self.visible = Mpris.players.some(player => ["Playing", "Paused"].includes(player.play_back_status));
			self.label = Mpris.players.some(player => player.play_back_status === "Playing") ? "󰎇" : "󰎊";
		},
		"player-changed",
	);
