import { Mpris } from "resource:///com/github/Aylur/ags/service/mpris.js";
import { MprisPlayer } from "types";

export default new (class MprisExtends extends Mpris {
	static {
		Service.register(this, {}, {});
	}

	constructor() {
		super();
	}

	#isPlayerctld(player: MprisPlayer) {
		return player.bus_name === "org.mpris.MediaPlayer2.playerctld";
	}

	getPlayers() {
		return this.players.flatMap(player => (!this.#isPlayerctld(player) ? player : []));
	}

	getIndex(target_player: MprisPlayer | null, players?: MprisPlayer[]) {
		if (!players) players = this.getPlayers();
		return players.findIndex(player => player.identity === target_player?.identity);
	}

	getRealPlayer(bus: string, players?: MprisPlayer[]) {
		if (!players) players = this.getPlayers();
		const target_player = this.getPlayer(bus);
		if (target_player) return players.find(player => player.identity === target_player.identity);
		else return undefined;
	}
})();
