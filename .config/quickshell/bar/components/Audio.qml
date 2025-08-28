import QtQuick
import Quickshell.Services.Pipewire
import qs.services
import qs.configs
import "widgets"

Row {
	anchors.verticalCenter: parent.verticalCenter
	spacing: Config.bar.spacing

	component Audio: BarButton {
		id: audio
		required property string name
		required property PwNode device
		required property list<string> icons
		readonly property PwNodeAudio audioNode: device?.audio ?? null
		visible: !!device?.ready && audioNode.volume >= 0
		icon: {
			if(audioNode?.muted) return icons[0]

			let levels = icons.length - 1
			let index = Math.min(levels - 1, Math.floor(audioNode?.volume * levels)) + 1
			return icons[index] ?? ""
		}
		font: ({ strikeout: audioNode?.muted })
		text: `${(audioNode?.volume * 100).toFixed(0)}%`
		onClicked: AudioService.script(`${audio.name} toggle`)
		onWheel: event => {
			if(event.angleDelta.y > 0)	AudioService.script(`${audio.name} increase`)
			else if(event.angleDelta.y < 0) AudioService.script(`${audio.name} decrease`)
		}
	}

	Audio {
		name: "microphone"
		device: AudioService.source
		icons: ['', '']
	}

	Audio {
		name: "speaker"
		device: AudioService.sink
		icons: ['', '', '', '']
	}
}
