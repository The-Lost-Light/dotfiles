import QtQuick
import QtQuick.Controls
import Quickshell.Io

Button {
	font.pixelSize: 16
	text: " "

	onClicked: process.running = true

	background: Rectangle {
		color: "transparent"
	}

	Process {
		id: process
		command: ["niri", "msg", "action", "toggle-overview"]
	}
}
