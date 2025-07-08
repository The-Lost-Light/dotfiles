pragma ComponentBehavior: Bound
import QtQuick
import Quickshell.Io
import Quickshell.Services.Pipewire
import "widgets"

Row {
	anchors.verticalCenter: parent.verticalCenter
	spacing: 4

	component Audio: BarMouseLabel {
		required property string name
		required property string icon
		text: {
			let device =
				name === "speaker" ? Pipewire.defaultAudioSink :
				name === "microphone" ? Pipewire.defaultAudioSource :
				null

			if (device) {
				let audio = device?.audio
				icon + (audio.muted ? "Mute" : (audio.volume * 100).toFixed(0) + '%')
			} else {
				`Not found ${name}!`
			}
		}
		onClicked: process.script(`${name} toggle`)
		onWheel: event => {
			if (event.angleDelta.y > 0) {
				process.script(`${name} increase`)
			} else if (event.angleDelta.y < 0) {
				process.script(`${name} decrease`)
			}
		}
	}

	Audio {
		name: "microphone"
		icon: "󰍮"
	}

	Audio {
		name: "speaker"
		icon: "󰕾"
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
