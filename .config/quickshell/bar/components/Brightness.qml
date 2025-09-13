import QtQuick
import qs.services
import "widgets"

BarButton {
	icon: {
		if(BrightnessService.percent >= 67) return LucideService.unicode("sun")
		else if(BrightnessService.percent >= 34) return LucideService.unicode("sun-medium")
		else return LucideService.unicode("sun-dim")
	}
	text: `${BrightnessService.percent}%`
	onWheel: event => {
		if(event.angleDelta.y > 0) BrightnessService.script("increase")
		else if(event.angleDelta.y < 0) BrightnessService.script("decrease")
	}
}
