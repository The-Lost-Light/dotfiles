import Mpris from "@services/mpris";
import card from "@osd/media/modules/card";
import { AgsStack } from "types";

// export default (self: AgsStack, bus: string | undefined) => {
// 	if (!bus) bus = Mpris.getPlayer()?.bus_name ?? "";

// 	const players = Mpris.players;
// 	const player_index = Mpris.realIndex(Mpris.playerIndex(bus));
// 	const playerctld_index = Mpris.playerctldIndex();
// 	const length = players.length - (playerctld_index >= 0 ? 1 : 0);

// 	const stack = { "-1": Widget.Box() };
// 	players
// 		.flatMap((player, index) => {
// 			if (!Mpris.isPlayerctld(player.bus_name))
// 				return card.set(player, Mpris.realIndex(index, playerctld_index), length);
// 			else return [];
// 		})
// 		.forEach((card, index) => (stack[index] = card));
// 	self.children = stack;

// 	card.shown.value = Math.max(player_index, Math.min(card.shown.value, length - 1));
// 	self.hook(card.shown, () => (self.shown = card.shown.value.toString()));
// };

export default (self: AgsStack, bus: string | undefined) => {
	if (!bus) bus = Mpris.getPlayer()?.bus_name ?? "";

	const players = Mpris.getPlayers();
	const index = Mpris.getIndex(Mpris.getPlayer(bus));
	const length = players.length;
	// print(length);

	const stack = { "-1": Widget.Box() };
	players.map((player, index) => card.set(player, index, length)).forEach((card, index) => (stack[index] = card));
	self.children = stack;

	card.shown.value = Math.max(index, Math.min(card.shown.value, length - 1));
	self.hook(card.shown, () => (self.shown = card.shown.value.toString()));
};
