import QtQuick
import QtQuick.Controls
import Quickshell.Io
import qs.services

Button {
	id: button
	required property string command
	property string color
	font {
		bold: true
		family: "Symbols Nerd Font"
		pixelSize: 48
	}
	palette.buttonText: color || undefined
	onClicked: process.running = true

	background: Rectangle {
		color: {
			if (button.pressed)
				return "#242933";
			else if (button.hovered)
				return "#292e39";
			else
				return "#2e3440";
		}
		implicitHeight: 96
		implicitWidth: 96
		radius: 16
	}

	Process {
		id: process
		command: button.command.split(/\s+/)
		onRunningChanged: if (!running) EventBus.requestPowerMenuClose()
	}
}
