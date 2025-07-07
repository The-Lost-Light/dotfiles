import QtQuick
import Quickshell.Io
import "widgets"

BarButton {
	text: " "
	onClicked: process.running = true

	Process {
		id: process
		command: ["niri", "msg", "action", "toggle-overview"]
	}
}
