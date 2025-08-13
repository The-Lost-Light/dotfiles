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
			implicitHeight: progress.implicitHeight
			implicitWidth: progress.implicitWidth
			mask: Region {}

			RingProgress {
				id: progress
				percent: Pipewire.defaultAudioSink?.audio.volume * 100 ?? 0
				backgroundColor: "#2a2a2a"
				color: "#00E5FF"
				radius: 32
				thickness: 8

				StyledLabel {
					anchors.centerIn: parent
					text: Math.round(Pipewire.defaultAudioSink?.audio.volume * 100 ?? 0) + "%"
				}
			}
		}
	}
}
