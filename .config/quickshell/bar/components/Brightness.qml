import QtQuick
import Quickshell.Io

Row {
	id: root

	Text {
		id: brightness
		color: "white"
		font {
			family: "Symbols Nerd Font"
			pixelSize: 16
		}
		text: "Not found brightness!"

		MouseArea {
			anchors.fill: parent
			onWheel: event => {
				if (event.angleDelta.y > 0) {
					root.script("increase")
				} else if (event.angleDelta.y < 0) {
					root.script("decrease")
				}
			}
		}
	}


	Process {
		id: process
		command: ["sh", "-c", "~/.config/niri/scripts/brightness.nu"]
		running: true
		stdout: StdioCollector {
			onStreamFinished: brightness.text = `󰃟${text * 20 / 51}%`
		}
	}

	function script(command) {
		process.command = ["sh", "-c", "~/.config/niri/scripts/brightness.nu " + command]
		process.running = true
	}
}
