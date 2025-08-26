pragma ComponentBehavior: Bound
import QtQuick
import Quickshell
import Quickshell.Services.Pipewire
import qs.services
import qs.widgets

Scope {
	id: root
	property real percent

	Behavior on percent {
		SmoothedAnimation {
			velocity: 10
			duration: 600
			easing.type: Easing.OutCubic
		}
	}

	LazyLoader {
		id: loader
		activeAsync: false

		PanelWindow {
			anchors {
				right: true
				bottom: true
			}
			color: "transparent"
			implicitHeight: column.implicitHeight
			implicitWidth: column.implicitWidth
			margins {
				right: 32
				bottom: 32
			}
			mask: Region {}

			Column {
				id: column
				spacing: 4

				RadioBar {
					percent: root.percent
					backgroundColor: "#2a2a2a"
					color: "white"
					radius: 24
					thickness: 8

					QuickLabel {
						anchors.centerIn: parent
						text: ''
					}
				}

				QuickLabel {
					anchors.horizontalCenter: parent.horizontalCenter
					text: Math.round(Pipewire.defaultAudioSink?.audio.volume * 100 ?? 0) + "%"
				}
			}
		}
	}

	Connections {
		target: AudioService

		function onSinkAudioChanged() {
			root.percent = Pipewire.defaultAudioSink?.audio.volume * 100 ?? 0
			loader.active = true
			hideTimer.restart()
		}
	}

	Timer {
		id: hideTimer
		interval: 1000
		onTriggered: loader.activeAsync = false
	}
}
