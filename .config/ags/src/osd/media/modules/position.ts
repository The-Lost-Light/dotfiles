import { MprisPlayer } from "types/service/mpris";
import minutes from "@lib/minutes";

export default (player: MprisPlayer) => Widget.Label(minutes(player.position));
