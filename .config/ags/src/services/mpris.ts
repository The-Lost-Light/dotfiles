import { Mpris } from "resource:///com/github/Aylur/ags/service/mpris.js";

export default new (class MprisExtends extends Mpris {
	static {
		Service.register(this, {}, {});
	}

	constructor() {
		super();
	}

	isPlayerctld(bus: string | undefined) {
		return bus === "org.mpris.MediaPlayer2.playerctld";
	}

	playerctldIndex() {
		return this.players.findIndex(player => this.isPlayerctld(player.bus_name));
	}

	playerIndex(bus: string) {
		const identity = this.getPlayer(bus)?.identity;
		if (!this.isPlayerctld(bus)) return this.players.findIndex(player => player.identity === identity);
		else return this.players.findIndex(player => player.identity === identity && !this.isPlayerctld(player.bus_name));
	}

	realIndex(player_index: number, playerctld_index?: number) {
		if (playerctld_index === undefined) playerctld_index = this.playerctldIndex();
		return 0 <= playerctld_index && playerctld_index < player_index ? player_index - 1 : player_index;
	}

	getBus(bus: string) {
		const index = this.playerIndex(bus);
		return index >= 0 ? this.players[index].bus_name : bus;
	}
})();
