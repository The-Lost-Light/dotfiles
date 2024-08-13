import Mpris from "@services/mpris";
import card from "@osd/media/modules/card";
import { MprisPlayer, AgsStack } from "types";

const realIndex = (player_index: number, playerctld_index: number) =>
	0 <= playerctld_index && playerctld_index < player_index ? player_index - 1 : player_index;

const findIndex = (players: MprisPlayer[], bus: string) => {
	const player_index = players.findIndex(
		player => player.bus_name === Mpris.getBus(bus) && !Mpris.isPlayerctld(player.bus_name),
	);
	const playerctld_index = players.findIndex(player => Mpris.isPlayerctld(player.bus_name));

	return [realIndex(player_index, playerctld_index), playerctld_index];
};

export default (self: AgsStack, bus: string | undefined) => {
	if (bus === undefined) bus = Mpris.getPlayer()?.bus_name ?? "";

	const players = Mpris.players;
	const [player_index, playerctld_index] = findIndex(players, bus);
	const length = players.length - (playerctld_index >= 0 ? 1 : 0);

	const stack = { "-1": Widget.Box() };
	players
		.flatMap((player, index) =>
			!Mpris.isPlayerctld(player.bus_name) ? card.set(player, realIndex(index, playerctld_index), length) : [],
		)
		.forEach((card, index) => (stack[index] = card));
	self.children = stack;

	card.shown.value = Math.max(player_index, Math.min(card.shown.value, length - 1));
	self.hook(card.shown, () => (self.shown = card.shown.value.toString()));
};
