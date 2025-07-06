import QtQuick
import QtQuick.Controls
import "root:services"

Button {
	id: root
	anchors.verticalCenter: parent.verticalCenter
	visible: ArchService.updates > 0
	font.pixelSize: 16
	text: `  ${ArchService.updates}`
	onClicked: ArchService.update()

	background: Rectangle {
		color: "transparent"
	}
}
