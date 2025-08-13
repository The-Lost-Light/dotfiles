import QtQuick
import Quickshell.Services.Pipewire
import qs.services
import qs.widgets
import qs.config

Row {
	anchors.verticalCenter: parent.verticalCenter
	spacing: Config.bar.spacing

	component Audio:
	StyledLabel {
		id: audio
		required property string name
		required property PwNode device
		required property string iconOn
		required property string iconOff
		readonly property PwNodeAudio audioNode: device?.audio ?? null
		visible: !!device?.ready && audioNode.volume >= 0
		text: audioNode?.muted ? `${iconOff}Mute` : `${iconOn}${(audioNode?.volume * 100).toFixed(0)}%`

		MouseArea {
			anchors.fill: parent
			onClicked: AudioService.script(`${audio.name} toggle`)
			onWheel: event => {
				if(event.angleDelta.y > 0) AudioService.script(`${audio.name} increase`)
				else if(event.angleDelta.y < 0) AudioService.script(`${audio.name} decrease`)
			}
		}
	}

	Audio {
		name: "microphone"
		device: AudioService.source
		iconOn: ""
		iconOff: ""
	}

	Audio {
		name: "speaker"
		device: AudioService.sink
		iconOn: ""
		iconOff: ""
	}
}
