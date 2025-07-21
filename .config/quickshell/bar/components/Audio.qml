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
		required property PwNode device
		required property string icon
		readonly property PwNodeAudio audio: device?.audio ?? null
		visible: !!device?.ready && audio.volume >= 0
		text: icon + (audio?.muted ? "Mute" : `${(audio?.volume * 100).toFixed(0)}%`)
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
		device: Pipewire.defaultAudioSource
		icon: "󰍮"
	}

	Audio {
		name: "speaker"
		device: Pipewire.defaultAudioSink
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
