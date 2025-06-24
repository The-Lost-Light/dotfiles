import QtQuick
import QtQuick.Controls
import Quickshell.Io

Button {
	id: button
	required property PowerButton modelData
	required property QtObject menu

	text: modelData.text
	font {
		bold: true
		family: "Symbols Nerd Font"
		pixelSize: 48
	}
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
		command: modelData.command.split(/\s+/)
		onRunningChanged: if (!running) menu.active = false
	}
}
