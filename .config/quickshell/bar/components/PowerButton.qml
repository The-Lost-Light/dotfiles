import QtQuick
import Quickshell
import qs.services
import qs.osd.power
import "widgets"

BarButton {
	text: "⏻"

	onClicked: {
		powerMenu.activeAsync = true
		timer.restart()
	}

	LazyLoader {
		id: powerMenu
		PowerMenu {}
	}

	Timer {
		id: timer
		interval: 3000
		onTriggered: powerMenu.activeAsync = false
	}

	Connections {
		target: EventBus

		function onRequestPowerMenuClose() {
			powerMenu.activeAsync = false
		}
	}
}
