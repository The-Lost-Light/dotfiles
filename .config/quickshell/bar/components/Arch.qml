import QtQuick
import qs.services
import "widgets"

BarButton {
	id: root
	visible: ArchService.updates > 0
	hoverEnabled: true
	iconFont: "Symbols Nerd Font"
	icon: ''
	text: `${ArchService.updates}`
	onClicked: ArchService.update()

	BarToolTip {
		item: root
		text: ArchService.packages.join("<br>")
	}
}
