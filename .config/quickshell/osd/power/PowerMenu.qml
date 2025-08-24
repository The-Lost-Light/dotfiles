pragma ComponentBehavior: Bound
import QtQuick
import Quickshell
import qs.services
import qs.configs

Scope {
	id: root
	default required property list<PowerButton> buttons

	Connections {
		target: EventBus

		function onRequestPowerPanelToggle() {
			lazyLoader.activeAsync = !lazyLoader.activeAsync
			if(timer.running) timer.stop()
			else timer.start()
		}
	}

	Timer {
		id: timer
		interval: 3000
		onTriggered: lazyLoader.activeAsync = false
	}

	LazyLoader {
		id: lazyLoader

		PanelWindow {
			anchors.right: true
			color: "transparent"
			exclusionMode: ExclusionMode.Ignore
			implicitHeight: column.implicitHeight
			implicitWidth: column.implicitWidth
			margins.right: Config.powerMenu.margin

			Column {
				id: column
				spacing: Config.powerMenu.spacing
				children: root.buttons
			}
		}
	}
}
