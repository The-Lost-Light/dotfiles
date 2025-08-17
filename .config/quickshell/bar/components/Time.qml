import QtQuick
import qs.services
import "widgets"

BarLabel {
	text: TimeService.time

	MouseArea {
		id: mouseArea
		anchors.fill: parent
		hoverEnabled: true
	}

	BarToolTip {
		item: mouseArea
		text: TimeService.date
	}
}
