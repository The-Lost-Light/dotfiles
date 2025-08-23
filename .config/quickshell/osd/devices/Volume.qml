import QtQuick
import Quickshell
import Quickshell.Services.Pipewire
import qs.services
import qs.widgets

Scope {
	id: root

	Connections {
		target: AudioService

		function onSinkAudioChanged() {
			loader.active = true
			hideTimer.restart()
		}
	}

	Timer {
		id: hideTimer
		interval: 1000
		onTriggered: loader.active = false
	}

	LazyLoader {
		id: loader
		active: false

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
					percent: Pipewire.defaultAudioSink?.audio.volume * 100 ?? 0
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
}
