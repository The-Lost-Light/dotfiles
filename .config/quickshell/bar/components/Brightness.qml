import QtQuick
import qs.services
import "widgets"

BarButton {
	iconFont: "Symbols Nerd Font"
	icon: '󰃟'
	text: `${BrightnessService.percent}`
	onWheel: event => {
		if (event.angleDelta.y > 0) BrightnessService.script("increase")
		else if (event.angleDelta.y < 0) BrightnessService.script("decrease")
	}
}
