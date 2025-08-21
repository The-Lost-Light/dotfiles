import QtQuick
import Quickshell.Io
import "widgets"

BarButton {
	iconFont: "Symbols Nerd Font"
	icon: " "
	onClicked: process.running = true

	Process {
		id: process
		command: ["niri", "msg", "action", "toggle-overview"]
	}
}
