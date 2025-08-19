import QtQuick
import Quickshell
import qs.services
import qs.osd.power
import "widgets"

BarButton {
	text: "⏻"
	onClicked: {
		powerPanel.activeAsync = !powerPanel.activeAsync
		if(timer.running) timer.stop()
		else timer.start()
	}

	LazyLoader {
		id: powerPanel
		PowerPanel {}
	}

	Timer {
		id: timer
		interval: 3000
		onTriggered: powerPanel.activeAsync = false
	}

	Connections {
		target: EventBus

		function onRequestPowerPanelClose() {
			powerPanel.activeAsync = false
		}
	}
}
