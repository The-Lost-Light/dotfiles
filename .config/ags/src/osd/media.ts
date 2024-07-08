import Mpris from "@services/mpris";
import Image from "@widgets/image";
import fileExists from "@lib/file_exists";

import { MprisPlayer } from "types/service/mpris";

const index = Variable(0);
const cards = (player: MprisPlayer, length: number) => {
	if (Mpris.isPlayerctld(player.bus_name)) return [];

	const image = fileExists(player.cover_path) ? Image({ path: player.cover_path }) : Widget.Box();

	const title = Widget.Label(player.track_title);

	const artist = Widget.Label(player.track_artists.join(", "));

	// BUG
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
				const length = players.length - Number(players.some(player => Mpris.isPlayerctld(player.bus_name)));

				self.children = players
					.flatMap(player => cards(player, length))
					.reduce((children, player, index) => ((children[index] = player), children), {});

				// TODO: use bus
				self.hook(index, () => {
					if (index.value >= 0 && index.value < length) self.shown = index.value.toString();
				});
			},
			"player-changed",
		),
	});

export default () => Widget.Window({ name: "media", anchor: ["top"], visible: false, child: card() });
