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
			loader.active = true;
			hideTimer.restart();
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

					QsLabel {
						anchors.centerIn: parent
						font.pixelSize: 16
						text: ""
					}
				}

				QsLabel {
					anchors.horizontalCenter: parent.horizontalCenter
					font.pixelSize: 16
					text: Math.round(Pipewire.defaultAudioSink?.audio.volume * 100 ?? 0) + "%"
				}
			}
		}
	}
}
