import media from "@widgets/media";
import control from "@osd/media/modules/control";
import { MprisPlayer } from "types";

const shown = Variable(0);

const left_card = (index: number) =>
	Widget.Button({
		class_name: "left",
		label: " ",
		on_clicked: () => --shown.value,
		setup: self =>
			Utils.idle(() => {
				if (!self.is_destroyed && !(index > 0)) self.visible = false;
			}),
	});
const right_card = (index: number, length: number) =>
	Widget.Button({
		class_name: "right",
		label: " ",
		on_clicked: () => ++shown.value,
		setup: self =>
			Utils.idle(() => {
				if (!self.is_destroyed && !(index < length - 1)) self.visible = false;
			}),
	});

const set = (player: MprisPlayer, index: number, length: number) =>
	Widget.Box({
		class_name: "media",
		children: [
			media.cover({ player, height: 188, class_name: "cover" }),
			Widget.Box({
				class_name: "info",
				vertical: true,
				children: [
					Widget.Box({
						vertical: true,
						vexpand: true,
						children: [
							Widget.Box([media.title({ player, class_name: "title" }), left_card(index), right_card(index, length)]),
							media.artist({ player, class_name: "artist", vpack: "start" }),
						],
					}),
					Widget.Box([
						Widget.Box({
							hexpand: true,
							vertical: true,
							children: [
								Widget.CenterBox({
									class_name: "control",
									start_widget: media.position({ player }),
									center_widget: Widget.Box({
										spacing: 4,
										children: [control.previous(player), control.play_paulse(player), control.next(player)],
									}),
									end_widget: media.length({ player }),
								}),
								media.progress({ player, width: 320, class_name: "progress" }),
							],
						}),
						media.icon({ player, size: 20, class_name: "icon" }),
					]),
				],
			}),
		],
	});

export default { shown, set };
