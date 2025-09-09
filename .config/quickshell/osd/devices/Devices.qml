pragma ComponentBehavior: Bound
import QtQuick
import Quickshell
import Quickshell.Services.Pipewire
import qs.services
import qs.configs

Scope {
	id: root
	property real sinkPercent
	property real sourcePercent
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

			Column {
				id: column
				spacing: Config.devices.chartSpacing

				Chart {

					visible: root.sourceActive
					iconFont.family: "lucide"
					icon: ''
					percent: root.sourcePercent
				}
				Chart {
					visible: root.sinkActive
					iconFont.family: "lucide"
					icon: ''
					percent: root.sinkPercent
				}
			}
		}
	}

	Connections {
		target: AudioService

		function onSinkAudioChanged() {
			root.sinkPercent = Pipewire.defaultAudioSink?.audio.volume * 100 ?? 0
			root.sinkActive = true
			hideTimer.restart()
		}

		function onSourceAudioChanged() {
			root.sourcePercent = Pipewire.defaultAudioSource?.audio.volume * 100 ?? 0
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
