pragma ComponentBehavior: Bound
import QtQuick
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Wayland
import qs.services
import qs.configs

Scope {
	id: root
	property real sinkPercent
	property bool sinkMuted
	property real sourcePercent
	property bool sourceMuted
	property bool sinkActive: false
	property bool sourceActive: false

	Behavior on sinkPercent {
		SmoothedAnimation {
			velocity: Config.devices.animationVelocity
			duration: Config.devices.animationMaxDuration
			easing.type: Easing.OutCubic
		}
	}

	Behavior on sourcePercent {
		SmoothedAnimation {
			velocity: Config.devices.animationVelocity
			duration: Config.devices.animationMaxDuration
			easing.type: Easing.OutCubic
		}
	}

	LazyLoader {
		id: lazyLoader
		activeAsync: root.sinkActive || root.sourceActive
		active: true

		PanelWindow {
			anchors {
				right: true
				bottom: true
			}
			color: "transparent"
			implicitHeight: column.implicitHeight
			implicitWidth: column.implicitWidth
			margins {
				right: Config.devices.marginRight
				bottom: Config.devices.marginBottom
			}
			mask: Region {}
			WlrLayershell.layer: WlrLayer.Overlay

			Column {
				id: column
				spacing: Config.devices.chartSpacing

				Chart {
					visible: root.sourceActive
					icon: LucideService.unicode("mic")
					mutedIcon: LucideService.unicode("mic-off")
					percent: root.sourcePercent
					muted: root.sourceMuted
				}
				Chart {
					visible: root.sinkActive
					icon: LucideService.unicode("volume-2")
					mutedIcon: LucideService.unicode("volume-off")
					percent: root.sinkPercent
					muted: root.sinkMuted
				}
			}
		}
	}

	Connections {
		target: AudioService

		function onSinkAudioChanged(percent, muted) {
			root.sinkPercent = percent || 0
			root.sinkMuted = muted ?? true
			root.sinkActive = true
			hideTimer.restart()
		}

		function onSourceAudioChanged(percent, muted) {
			root.sourcePercent = percent || 0
			root.sourceMuted = muted ?? true
			root.sourceActive = true
			hideTimer.restart()
		}
	}

	Timer {
		id: hideTimer
		interval: Config.devices.showInterval
		onTriggered: {
			root.sinkActive = false
			root.sourceActive = false
		}
	}
}
