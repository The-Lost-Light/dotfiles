import QtQuick
import QtQuick.Controls
import "root:services"

Text {
	id: root
	anchors.verticalCenter: parent.verticalCenter
	color: "white"
	font.pixelSize: 16
	text: TimeService.time

	MouseArea {
		id: mouse_area
		anchors.fill: parent
		hoverEnabled: true
	}

	ToolTip {
		visible: mouse_area.containsMouse
		delay: 300
		text: TimeService.date
		background: Rectangle {
			color: "#1e1e2e"
			height: root.height
			radius: 8
		}
		palette.toolTipText: "white"
	}
}
