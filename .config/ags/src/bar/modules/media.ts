import Mpris from "@services/mpris";
import { capitalize } from "utils";

export default () =>
	Widget.Button({
		class_name: "media",
		child: Widget.Label(),
	}).hook(
		Mpris,
		(self, bus) => {
			const player = Mpris.getPlayer(Mpris.getBus(bus));
			self.visible = Mpris.isPlayPause(player?.bus_name);
			self.child.label = `${capitalize(player?.name)} ${player?.play_back_status === "Playing" ? "" : ""}`;
			self.on_clicked = () => player?.playPause();
		},
		"player-changed",
	);
