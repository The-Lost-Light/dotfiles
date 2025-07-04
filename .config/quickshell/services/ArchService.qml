pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
	id: root
	property string prompt: "\x1b[34m\n:: Update Completed!\n\x1b[33m:: Press Enter to exit!\x1b[0m"
	readonly property int updates: checker.packages.length - 1

	Process {
		id: checker
		property list<string> packages
		command: ["sh", "-c", "checkupdates; yay -Qua"]
		running: true
		stdout: StdioCollector {
			onStreamFinished: checker.packages = text.split("\n")
		}
	}

	Timer {
		interval: 600000
		running: true
		repeat: true
		onTriggered: checker.running = true
	}

	Process {
		id: updater
		command: ["kitty", "fish", "-c", `yay; read -P "${root.prompt}"`]
		stdout: StdioCollector {
			onStreamFinished: checker.running = true
		}
	}

	function update() {
		updater.running = true
	}
}
