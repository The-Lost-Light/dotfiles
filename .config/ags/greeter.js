const greetd = await Service.import("greetd");

const name = Widget.Entry({
  placeholder_text: "Username",
  text: Utils.USER,
  on_accept: (self) => (self.set_position(-1), password.grab_focus()),
});

const password = Widget.Entry({
  placeholder_text: "Password",
  visibility: false,
  on_accept: () => {
    greetd
      .login(
        name.text || "",
        password.text || "",
        "$SHELL -lc 'Hyprland > /dev/null 2>&1'",
      )
      .catch((err) => (response.label = JSON.stringify(err)));
  },
});

const response = Widget.Label();

const win = Widget.Window({
  css: "background-color: transparent;",
  anchor: ["top", "left", "right", "bottom"],
  keymode: "exclusive",
  child: Widget.Box({
    vertical: true,
    hpack: "center",
    vpack: "center",
    hexpand: true,
    vexpand: true,
    children: [name, password, response],
  }),
});

App.config({ windows: [win] });
