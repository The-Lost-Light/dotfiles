import Image from "@widgets/image";

const Mpris = await Service.import("mpris");

const players = Mpris.bind("players").as(players =>
	players.map(player => {
		const image = player.cover_path ? Image({ path: player.cover_path }) : Widget.Box();

		const title = Widget.Label({ label: player.bind("track_title") });

		const artist = Widget.Label({ label: player.bind("track_artists").as(artists => artists.join(", ")) });

		const positionSlider = Widget.Slider({
			visible: player.bind("length").as(l => l > 0),
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

		return Widget.Box(
			{
				class_name: "player",
			},
			image,
			title,
			artist,
			positionSlider,
		);
	}),
);

export default () =>
	Widget.Window({ name: "media", anchor: ["top"], visible: false }, Widget.Box({ children: players }));
