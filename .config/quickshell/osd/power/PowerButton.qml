import QtQuick
import QtQuick.Controls
import Quickshell
import qs.config

Button {
	id: button
	required property string command
	property string color
	font {
		bold: true
		family: "Symbols Nerd Font"
		pixelSize: Config.powerMenu.fontSize
	}
	palette.buttonText: color || undefined
	onClicked: {
		Quickshell.execDetached(button.command.split(/\s+/))
		EventBus.requestPowerMenuClose()
	}

	background: Rectangle {
		color: {
			if (button.pressed)	return Color.pressed
			else if (button.hovered) return Color.hovered
			else return Color.background
		}
		implicitHeight: Config.powerMenu.length
		implicitWidth: Config.powerMenu.length
		radius: Config.powerMenu.radius
	}
}
