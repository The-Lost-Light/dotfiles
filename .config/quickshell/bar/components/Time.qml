import QtQuick
import QtQuick.Controls
import "root:services"
import "widgets"

BarMouseLabel {
	id: root
	anchors.verticalCenter: parent.verticalCenter
	hoverEnabled: true
	text: TimeService.time

	ToolTip {
		visible: root.containsMouse
		delay: 300
		text: TimeService.date
		background: Rectangle {
			color: "#1e1e2e"
			height: root.height
			radius: 8
		}
	}
}
