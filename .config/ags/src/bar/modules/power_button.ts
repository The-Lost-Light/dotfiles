import AutoTimeout from "@lib/auto_timeout";

const closeMenu = new AutoTimeout();

export default () =>
	Widget.Button({
		class_name: "power",
		label: "",
		on_clicked: () => {
			App.openWindow("power_menu");
			closeMenu.set({ delay: 4, callback: () => App.closeWindow("power_menu") });
		},
	});
