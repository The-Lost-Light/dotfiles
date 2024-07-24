const power_button = (class_name: string, icon: string, command: string) =>
	Widget.Button({
		class_names: ["power_menu", "button", class_name],
		child: Widget.Label(icon),
		onClicked: () => Utils.exec(command),
	});

const Lock = () => power_button("lock", "", "hyprlock -q");
const Logout = () => power_button("logout", "", "hyprctl dispatch exit");
const Poweroff = () => power_button("poweroff", "󰐥", "systemctl poweroff");
const Reboot = () => power_button("reboot", "", "systemctl reboot");
const Sleep = () => power_button("sleep", "󰤄", "systemctl suspend");

export default () =>
	Widget.Window({
		name: "power_menu",
		class_name: "power_menu",
		visible: false,
		anchor: ["right"],
		child: Widget.Box({
			vertical: true,
			children: [Lock(), Logout(), Poweroff(), Reboot(), Sleep()],
		}),
	});
