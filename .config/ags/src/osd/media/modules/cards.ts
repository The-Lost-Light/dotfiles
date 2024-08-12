import Mpris from "@services/mpris";
import setCard from "@osd/media/modules/card";
import { shown } from "@osd/media/modules/cards_control";
import { MprisPlayer, AgsStack } from "types";

const realIndex = (player_index: number, playerctld_index: number) =>
	0 <= playerctld_index && playerctld_index < player_index ? player_index - 1 : player_index;

const findIndex = (players: MprisPlayer[], bus: string) => {
	const player_index = players.findIndex(player => player.bus_name === Mpris.getBus(bus));
	const playerctld_index = players.findIndex(element => Mpris.isPlayerctld(element.bus_name));

	return [realIndex(player_index, playerctld_index), playerctld_index];
};

export default (self: AgsStack, bus: string | undefined) => {
	if (bus === undefined) bus = Mpris.getPlayer()?.bus_name ?? "";

	const players = Mpris.players;
	const [player_index, playerctld_index] = findIndex(players, bus);
	const length = players.length - (playerctld_index >= 0 ? 1 : 0);

	const stack = players
		.flatMap((player, index) =>
			!Mpris.isPlayerctld(player.bus_name) ? setCard(player, realIndex(index, playerctld_index), length) : [],
		)
		.reduce((stack, card, index) => ((stack[index] = card), stack), {});
	self.children = Object.keys(stack).length > 0 ? stack : { 0: Widget.Box(Widget.Label("NO player! QQ")) };

	if (player_index >= 0) shown.value = player_index;
	self.hook(shown, () => {
		if (shown.value >= 0 && shown.value < length) self.shown = shown.value.toString();
	});
};
