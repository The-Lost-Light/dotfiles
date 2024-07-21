import Mpris from "@services/mpris";

import setCard, { shown } from "@osd/media/card";

import { MprisPlayer } from "types/service/mpris";

const realIndex = (player_index: number, playerctld_index: number) =>
	0 <= playerctld_index && playerctld_index < player_index ? player_index - 1 : player_index;
const findIndex = (players: MprisPlayer[], bus: string) => {
	const player_index = players.findIndex(player => player.bus_name === Mpris.getBus(bus));
	const playerctld_index = players.findIndex(element => Mpris.isPlayerctld(element.bus_name));

	return [realIndex(player_index, playerctld_index), playerctld_index];
};

export default () =>
	Widget.Stack().hook(
		Mpris,
		(self, bus) => {
			if (bus === undefined) bus = Mpris.getPlayer()?.bus_name;

			const players = Mpris.players;
			const [player_index, playerctld_index] = findIndex(players, bus);
			const length = players.length - (playerctld_index >= 0 ? 1 : 0);

			const stack = players
				.flatMap((player, index) => setCard(player, realIndex(index, playerctld_index), length))
				.reduce((stack, card, index) => ((stack[index] = card), stack), {});
			self.children = Object.keys(stack).length > 0 ? stack : { 0: Widget.Box(Widget.Label("NO player! QQ")) };

			if (player_index >= 0) shown.value = player_index;
			self.hook(shown, () => {
				if (shown.value >= 0 && shown.value < length) self.shown = shown.value.toString();
			});
		},
		"player-changed",
	);
