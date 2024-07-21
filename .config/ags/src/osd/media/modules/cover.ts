import Image from "@widgets/image";
import fileExists from "@lib/file_exists";

import { MprisPlayer } from "types/service/mpris";

export default (player: MprisPlayer) =>
	fileExists(player.cover_path)
		? Image({ path: player.cover_path, width: 188 })
		: Widget.Box({ class_names: ["media", "osd", "image"] });
