import { Mpris } from "resource:///com/github/Aylur/ags/service/mpris.js";

export default new (class MprisExtends extends Mpris {
	static {
		Service.register(this, {}, {});
	}

	constructor() {
		super();

		// Fix Spotify issue that its initial mpris values are empty
		this.connect("player-added", (_, bus) => {
			if (bus.includes("spotify")) {
				this.getPlayer(bus)?.next();
				this.getPlayer(bus)?.previous();
				this.getPlayer(bus)?.playPause();
			}
		});
	}

	isPlayerctld(bus: string | undefined) {
		return bus === "org.mpris.MediaPlayer2.playerctld";
	}

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
