import QtQuick
import qs.services
import qs.widgets
import "widgets"

StyledLabel {
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
