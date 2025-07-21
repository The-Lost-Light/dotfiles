import QtQuick
import qs.services
import "widgets"

BarMouseLabel {
	id: root
	hoverEnabled: true
	visible: ArchService.updates > 0
	text: `${ArchService.updates}`
	onClicked: ArchService.update()

	BarToolTip {
		item: root
		text: ArchService.packages.join("<br>")
	}
}
