import QtQuick
import QtQuick.Controls
import Quickshell.Io

Button {
	font.pixelSize: 16
	text: " "

	background: Rectangle {
		color: "transparent"
	}

	onClicked: process.running = true

	Process {
		id: process

		command: ["niri", "msg", "action", "toggle-overview"]
	}
}
