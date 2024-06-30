const Mpris = await Service.import("mpris");

export default () =>
	Widget.Button({
		class_name: "media",
		child: Widget.Label(),
	}).hook(
		Mpris,
		(self, bus) => {
			const player = Mpris.getPlayer(bus);
			self.visible = !!player && player?.play_back_status !== "Stopped";
			self.child.label =
				player?.play_back_status === "Playing" ? `${player?.name} ` : `${player?.name} ` ?? "Nothing is playing!";
			self.on_clicked = () => player?.playPause();
		},
		"player-changed",
	);
