import QtQuick
import QtQuick.Controls
import Quickshell
import qs.services
import qs.configs

Button {
	id: button
	required property string command
	property color color: "white"
	font {
		bold: true
		family: "lucide"
		pixelSize: Config.powerMenu.fontSize
	}
	palette.buttonText: color
	onClicked: {
		Quickshell.execDetached(button.command.split(/\s+/))
		EventBus.requestPowerPanelToggle()
	}

	background: Rectangle {
		color: {
			if(button.pressed)	return Color.powerMenu.pressed
			else if(button.hovered) return Color.powerMenu.hovered
			else return Color.powerMenu.background
		}
		implicitHeight: Config.powerMenu.length
		implicitWidth: Config.powerMenu.length
		radius: Config.powerMenu.radius
	}
}
