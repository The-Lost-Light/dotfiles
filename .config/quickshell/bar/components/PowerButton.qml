import QtQuick
import Quickshell
import "root:services"
import "widgets"
import "root:osd/power"

BarButton {
	text: "⏻ "
	onClicked: {
		power_menu.activeAsync = true
		timer.restart()
	}

	LazyLoader {
		id: power_menu
		PowerMenu {}
	}

	Timer {
		id: timer
		interval: 3000
		onTriggered: power_menu.activeAsync = false
	}

	Connections {
		target: EventBus

		function onRequestPowerMenuClose() {
			power_menu.activeAsync = false
		}
	}
}
