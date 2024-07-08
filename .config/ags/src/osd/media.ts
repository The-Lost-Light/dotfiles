import Mpris from "@services/mpris";
import Image from "@widgets/image";

import { MprisPlayer } from "types/service/mpris";

const index = Variable(0);
const cards = (player: MprisPlayer, length: number) => {
	if (Mpris.isPlayerctld(player.bus_name)) return [];

	const image = player.cover_path ? Image({ path: player.cover_path }) : Widget.Box();

	const title = Widget.Label(player.track_title);

	const artist = Widget.Label(player.track_artists.join(", "));

	const position = Widget.Slider({
		visible: player.length > 0,
		draw_value: true,
		setup: self => {
			const update = () => {
				const value = player.position / player.length;
				self.value = value > 0 ? value : 0;
			};
			self.hook(player, update);
			self.hook(player, update, "position");
			self.poll(1000, update);
		},
	});

	const left_card = Widget.Button({
		visible: index.bind().as(i => i !== 0),
		child: Widget.Label("<-"),
		on_clicked: () => --index.value,
	});

	const right_card = Widget.Button({
		// length - 2 if use playerctld
		visible: index.bind().as(i => i < length - 1),
		child: Widget.Label("->"),
		on_clicked: () => ++index.value,
	});

	return Widget.Box({
		children: [
			image,
			Widget.Box({
				vertical: true,
				children: [
					Widget.Box({
						children: [title, left_card, right_card],
					}),
					artist,
					position,
				],
			}),
		],
	});
};

import { BindingVariable } from "types";

const card = () =>
	Widget.Box({
		child: Widget.Stack().hook(
			Mpris,
			self => {
				const players = Mpris.players;

				self.children = players
					.flatMap(player =>
						cards(player, players.length - Number(players.some(player => Mpris.isPlayerctld(player.bus_name)))),
					)
					.reduce((children, player, index) => ((children[index] = player), children), {});

				// TODO: use bus
				shown: players.reduce((sum, player) => sum + Number(!Mpris.isPlayerctld(player.bus_name)), 0)
					? index.value.toString()
					: undefined;
			},
			"player-changed",
		),
	});

export default () => Widget.Window({ name: "media", anchor: ["top"], visible: false, child: card() });
