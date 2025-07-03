import QtQuick
import QtQuick.Controls
import Quickshell.Io
import "root:services"

Button {
	id: root
	anchors.verticalCenter: parent.verticalCenter
	visible: ArchService.updates > 0
	font.pixelSize: 16
	text: `  ${ArchService.updates}`
	onClicked: update.running = true

	background: Rectangle {
		color: "transparent"
	}

	Process {
		id: update
		command: ["kitty", "yay"]
	}
}
