import QtQuick
import qs.services
import "widgets"

BarLabel {
	text: `󰃟${BrightnessService.percent}`

	MouseArea {
		anchors.fill: parent
		onWheel: event => {
			if(event.angleDelta.y > 0) {
				BrightnessService.script("increase")
			} else if(event.angleDelta.y < 0) {
				BrightnessService.script("decrease")
			}
		}
	}
}
