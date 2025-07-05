import QtQuick.Controls
import Quickshell.Io

Switch {
	height: parent.height
	text: '󰍹'
	onClicked: {
		process.command = ["niri", "msg", "output", "eDP-1", checked? "on" : "off"]
		process.running = true
	}

	Process {
		id: process
	}
}
