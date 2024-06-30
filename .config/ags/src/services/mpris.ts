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

	getBus(bus: string) {
		if (bus === "org.mpris.MediaPlayer2.playerctld")
			return this.players.find(player => player.identity === this.getPlayer(bus)?.identity && player.bus_name !== bus)
				?.bus_name;
		else return bus;
	}
})();
