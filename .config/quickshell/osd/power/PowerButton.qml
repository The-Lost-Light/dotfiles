import QtQuick
import QtQuick.Controls
import Quickshell
import qs.services
import qs.config

Button {
	id: button
	required property string command
	property color color: "white"
	font {
		bold: true
		family: "Symbols Nerd Font"
		pixelSize: Config.powerMenu.fontSize
	}
	palette.buttonText: color
	onClicked: {
		Quickshell.execDetached(button.command.split(/\s+/))
		EventBus.requestPowerMenuClose()
	}

	background: Rectangle {
		color: {
			if(button.pressed)	return Color.pressed
			else if(button.hovered) return Color.hovered
			else return Color.background
		}
		implicitHeight: Config.powerMenu.length
		implicitWidth: Config.powerMenu.length
		radius: Config.powerMenu.radius
	}
}
