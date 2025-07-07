import QtQuick
import "root:services"
import "widgets"

BarButton {
	visible: ArchService.updates > 0
	text: `  ${ArchService.updates}`
	onClicked: ArchService.update()
}
