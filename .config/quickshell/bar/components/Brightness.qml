import QtQuick
import "root:services"

Row {
	id: root
	signal request()

	Text {
		id: brightness
		color: "white"
		font {
			family: "Symbols Nerd Font"
			pixelSize: 16
		}
		text: BrightnessService.percent

		MouseArea {
			anchors.fill: parent
			onWheel: event => {
				if (event.angleDelta.y > 0) {
					BrightnessService.script("increase")
				} else if (event.angleDelta.y < 0) {
					BrightnessService.script("decrease")
				}
			}
		}
	}
}
