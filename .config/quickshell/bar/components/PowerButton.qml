import QtQuick
import qs.services
import "widgets"

BarButton {
	icon: ''
	onClicked: EventBus.requestPowerPanelToggle()
}
