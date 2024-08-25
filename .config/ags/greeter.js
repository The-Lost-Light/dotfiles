const Greetd = await Service.import("greetd");

const username = Widget.Entry({
	placeholder_text: "Username",
	text: Utils.USER,
	on_accept: self => (self.set_position(-1), password.grab_focus()),
});

const password = Widget.Entry({
	placeholder_text: "Password",
	visibility: false,
	on_accept: () =>
		Greetd.login(username.text, password.text, "$SHELL -lc 'Hyprland > /dev/null 2>&1'").catch(
			err => (response.label = err.description),
		),
});

const response = Widget.Label();

App.addWindow(
	Widget.Window({
		name: "greeter",
		class_name: "greeter",
		anchor: ["top", "left", "right", "bottom"],
		keymode: "exclusive",
		child: Widget.Box({
			vertical: true,
			hpack: "center",
			vpack: "center",
			hexpand: true,
			vexpand: true,
			children: [username, password, response],
			setup: () => password.grab_focus(),
		}),
	}),
);
