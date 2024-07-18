import Mpris from "@services/mpris";
import Image from "@widgets/image";
import fileExists from "@lib/file_exists";

import { MprisPlayer } from "types/service/mpris";

const shown = Variable(0);

const realIndex = (player_index: number, playerctld_index: number) =>
	0 <= playerctld_index && playerctld_index < player_index ? player_index - 1 : player_index;
const findIndex = (players: MprisPlayer[], bus: string) => {
	const player_index = players.findIndex(player => player.bus_name === Mpris.getBus(bus));
	const playerctld_index = players.findIndex(element => Mpris.isPlayerctld(element.bus_name));

	return [realIndex(player_index, playerctld_index), playerctld_index];
};

const setCard = (player: MprisPlayer, index: number, length: number) => {
	if (Mpris.isPlayerctld(player.bus_name)) return [];

	const image = fileExists(player.cover_path) ? Image({ path: player.cover_path, height: 188 }) : Widget.Box();

	const title = Widget.Label(player.track_title);

	const artist = Widget.Label(player.track_artists.join(", "));

	const position = Widget.Slider({
		setup: self => {
			Utils.idle(() => {
				if (!self.is_destroyed)
					if (0 <= player.position && player.position <= player.length) {
						const update = () => (self.value = player.position / player.length);

						self.hook(player, update);
						self.hook(player, update, "position");
						self.poll(1000, update);
					} else self.visible = false;
			});
		},
	});

	const left_card = Widget.Button({
		visible: index > 0,
		child: Widget.Label("<-"),
		setup: self => Utils.idle(() => !self.is_destroyed && (self.visible = index > 0)),
		on_clicked: () => --shown.value,
	});

	const right_card = Widget.Button({
		child: Widget.Label("->"),
		setup: self => Utils.idle(() => !self.is_destroyed && (self.visible = index < length - 1)),
		on_clicked: () => ++shown.value,
	});

	const play_paulse = Widget.Button({
		child: Widget.Label(player?.play_back_status === "Playing" ? "" : ""),
		on_clicked: () => player.playPause(),
	});

	return Widget.Box({
		class_names: ["media", "osd"],
		children: [
			image,
			Widget.Box({
				class_names: ["media", "osd", "text"],
				vertical: true,
				children: [
					Widget.Box({
						children: [title, left_card, right_card],
					}),
					artist,
					play_paulse,
					position,
				],
			}),
		],
	});
};

const setCards = () =>
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

export default () => Widget.Window({ name: "media", anchor: ["top"], visible: false, child: setCards() });
