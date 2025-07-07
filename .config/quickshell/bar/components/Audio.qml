pragma ComponentBehavior: Bound
import QtQuick
import Quickshell.Io
import Quickshell.Services.Pipewire
import "widgets"

Row {
	spacing: 4

	ListModel {
		id: audio_model

		ListElement {
			icon: "󰍮"
			device: "microphone"
		}
		ListElement {
			icon: "󰕾"
			device: "speaker"
		}
	}

	Repeater {
		model: audio_model

		BarMouseLabel {
			required property var modelData
			text: {
				let device =
					modelData.device === "speaker" ? Pipewire.defaultAudioSink :
					modelData.device === "microphone" ? Pipewire.defaultAudioSource :
					null

				if (device) {
					let audio = device?.audio
					modelData.icon + (audio.muted ? "Mute" : (audio.volume * 100).toFixed(0) + '%')
				} else {
					`Not found ${modelData.device}!`
				}
			}
			onClicked: process.script(`${modelData.device} toggle`)
			onWheel: event => {
				if (event.angleDelta.y > 0) {
					process.script(`${modelData.device} increase`)
				} else if (event.angleDelta.y < 0) {
				process.script(`${modelData.device} decrease`)
				}
			}
		}
	}

	PwObjectTracker {
		objects: [Pipewire.defaultAudioSink, Pipewire.defaultAudioSource]
	}

	Process {
		id: process

		function script(parameter) {
			command = ["sh", "-c", "~/.config/niri/scripts/audio.nu " + parameter]
			running = true
		}
	}
}
