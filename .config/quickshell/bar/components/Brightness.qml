import QtQuick
import qs.services
import "widgets"

BarButton {
	iconFont: "lucide"
	icon: {
		if(BrightnessService.percent >= 67) return ''
		else if(BrightnessService.percent >= 34) return ''
		else return ''
	}
	text: `${BrightnessService.percent}%`
	onWheel: event => {
		if (event.angleDelta.y > 0) BrightnessService.script("increase")
		else if (event.angleDelta.y < 0) BrightnessService.script("decrease")
	}
}
