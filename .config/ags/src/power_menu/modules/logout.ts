export default () =>
  Widget.Button({
    class_name: "logout",
    child: Widget.Label(""),
    onClicked: () => Utils.exec("hyprctl dispatch exit"),
  });
