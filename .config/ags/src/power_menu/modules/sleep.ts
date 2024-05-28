export default () =>
  Widget.Button({
    class_name: "sleep",
    child: Widget.Label("󰤄"),
    onClicked: () => Utils.exec("systemctl suspend"),
  });
