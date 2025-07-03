pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
	id: root
	readonly property int updates: checker.packages.length - 1

	Process {
		id: checker
		property list<string> packages
		command: ["yay", "-Qu"]
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
}
