import QtQuick
import qs.services
import "widgets"

BarButton {
	icon: LucideService.unicode("power")
	onClicked: EventBus.requestPowerPanelToggle()
}
