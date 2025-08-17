import QtQuick
import qs.services
import "widgets"

BarLabel {
	visible: ArchService.updates > 0
	text: `${ArchService.updates}`

	MouseArea {
		id: mouseArea
		anchors.fill: parent
		hoverEnabled: true
		onClicked: ArchService.update()
	}

	BarToolTip {
		item: mouseArea
		text: ArchService.packages.join("<br>")
	}
}
