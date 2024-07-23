import { Mpris } from "resource:///com/github/Aylur/ags/service/mpris.js";

import { MprisPlayer } from "types";

export default new (class MprisExtends extends Mpris {
	static {
		Service.register(this, {}, {});
	}

	constructor() {
		super();

		// Fix Spotify empty mpris value when initial
		this.connect("player-added", (_, bus) => {
			if (bus.includes("spotify")) {
				this.getPlayer(bus)?.playPause();
				this.getPlayer(bus)?.playPause();
			}
		});
	}

	// Fix Spotify
	getLength(player: MprisPlayer) {
		if (player.length === 0) return Number(Utils.exec("playerctl metadata mpris:length")) / 1000000;
		else return player.length;
	}

	isPlayerctld(bus: string | undefined) {
		return bus === "org.mpris.MediaPlayer2.playerctld";
	}

	// Get real bus from playerctld
	getBus(bus: string | undefined) {
		if (this.isPlayerctld(bus))
			return (
				this.players.find(player => player.identity === this.getPlayer(bus)?.identity && player.bus_name !== bus)
					?.bus_name ?? bus
			);
		else return bus;
	}

	isPlayPause(bus: string | undefined) {
		return (
			!!this.getPlayer(bus) &&
			!this.isPlayerctld(this.getBus(bus)) &&
			this.getPlayer(bus)?.play_back_status !== "Stopped"
		);
	}
})();
