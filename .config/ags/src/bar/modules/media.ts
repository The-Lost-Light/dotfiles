import Mpris from "@services/mpris";

export default () =>
	Widget.Button({
		class_name: "media",
		child: Widget.Label(),
	}).hook(
		Mpris,
		(self, bus) => {
			const player = Mpris.getPlayer(Mpris.getBus(bus));
			self.visible = !!player && player?.play_back_status !== "Stopped";
			self.child.label = `${player?.name} ${player?.play_back_status === "Playing" ? "" : ""}`;
			self.on_clicked = () => player?.playPause();
		},
		"player-changed",
	);
