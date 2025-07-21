import QtQuick
import qs.services
import "widgets"

BarMouseLabel {
	text: BrightnessService.percent
	onWheel: event => {
		if (event.angleDelta.y > 0) {
			BrightnessService.script("increase")
		} else if (event.angleDelta.y < 0) {
			BrightnessService.script("decrease")
		}
	}
}
