import Image from "@widgets/image";
import fileExists from "@lib/file_exists";

import { MprisPlayer } from "types";

export default (player: MprisPlayer) =>
	Widget.Box({ class_names: ["osd", "media", "image"] }).hook(player, self => {
		const path = fileExists(player.cover_path) ? player.cover_path : App.configDir + "/assets/cd.jpg";
		self.child = Image({ path, width: 188 });
	});
