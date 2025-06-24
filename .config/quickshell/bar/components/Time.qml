import QtQuick
import "root:services"

Text {
	anchors.verticalCenter: parent.verticalCenter
	color: "white"
	font.pixelSize: 16
	text: TimeService.time
}
