import { MprisPlayer } from "types";

import image from "@lib/image";

export default (player: MprisPlayer) =>
	Widget.Box({ class_names: ["osd", "media", "image"] }).hook(
		player,
		self => (self.css = image({ path: player.cover_path, height: 188 })),
	);
