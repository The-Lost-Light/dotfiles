import Mpris from "@services/mpris";
import Image from "@widgets/image";
import fileExists from "@lib/file_exists";

import { MprisPlayer } from "types/service/mpris";

const shown = Variable(0);
const visible = Variable(false).bind();

const cards = (player: MprisPlayer, index: number, length: number) => {
	if (Mpris.isPlayerctld(player.bus_name)) return [];

	const image = fileExists(player.cover_path) ? Image({ path: player.cover_path }) : Widget.Box();

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

const card = () =>
	Widget.Stack().hook(
		Mpris,
		(self, bus) => {
			const players = Mpris.players;
			const playerctld_index = players.findIndex(element => Mpris.isPlayerctld(element.bus_name));
			const length = players.length - Number(playerctld_index >= 0);

			self.children = players
				.flatMap((player, index) =>
					cards(player, 0 <= playerctld_index && playerctld_index < index ? index - 1 : index, length),
				)
				.reduce((children, player, index) => ((children[index] = player), children), {});

			// TODO: use bus

			// index.value
			self.hook(shown, () => {
				if (shown.value >= 0 && shown.value < length) self.shown = shown.value.toString();
			});
		},
		"player-changed",
	);

export default () => Widget.Window({ name: "media", anchor: ["top"], visible: visible, child: card() });
