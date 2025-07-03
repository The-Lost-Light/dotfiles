import QtQuick
import Quickshell.Io
import Quickshell.Services.Pipewire

Row {
	id: root
	spacing: 4

	Text {
		color: "white"
		font {
			family: "Symbols Nerd Font"
			pixelSize: 16
		}
		text: {
			if (Pipewire.defaultAudioSource) {
				let audio = Pipewire.defaultAudioSource?.audio
				audio.muted ? "Mute" : '󰍮' + (audio.volume * 100).toFixed(0) + '%'
			} else {
				"Not found source!"
			}
		}

		MouseArea {
			anchors.fill: parent
			onClicked: root.script("microphone toggle")
			onWheel: event => {
				if (event.angleDelta.y > 0) {
					root.script("microphone increase")
				} else if (event.angleDelta.y < 0) {
					root.script("microphone decrease")
				}
			}
		}
	}

	Text {
		color: "white"
		font {
			family: "Symbols Nerd Font"
			pixelSize: 16
		}
		text: {
			if (Pipewire.defaultAudioSink) {
				let audio = Pipewire.defaultAudioSink?.audio
				audio.muted ? "Mute" : '󰕾 ' + (audio.volume * 100).toFixed(0) + '%'
			} else {
				"Not found sink!"
			}
		}

		MouseArea {
			anchors.fill: parent
			onClicked: root.script("speaker toggle")
			onWheel: event => {
				if (event.angleDelta.y > 0) {
					root.script("speaker increase")
				} else if (event.angleDelta.y < 0) {
					root.script("speaker decrease")
				}
			}
		}
	}

	Process {
		id: process
	}

	PwObjectTracker {
		objects: [Pipewire.defaultAudioSink, Pipewire.defaultAudioSource]
	}

	function script(command) {
		process.command = ["sh", "-c", "~/.config/niri/scripts/audio.nu " + command]
		process.running = true
	}
}
