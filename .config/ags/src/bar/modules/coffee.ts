import Inhibit from "@services/inhibit";

export default () =>
	Widget.Button({
		class_name: "inhibit",
		label: Inhibit.bind("is_inhibit").as(active => (active ? "󰒳" : "󰒲")),
		on_clicked: () => Inhibit.toggle(),
	});
