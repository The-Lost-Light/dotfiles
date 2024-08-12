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

	// Get real bus from playerctld
	getBus(bus: string | undefined) {
		if (this.isPlayerctld(bus))
			return (
				this.players.find(player => player.identity === this.getPlayer(bus)?.identity && player.bus_name !== bus)
					?.bus_name ?? bus
			);
		else return bus;
	}
})();
