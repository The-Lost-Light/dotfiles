pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
	id: root

	readonly property list<string> packages: checker.packages
	property string prompt: "(ansi blue)\n:: Update Completed!\n(ansi yellow):: Press Enter to exit!(ansi reset)"
	readonly property int updates: checker.packages.length

	function update() {
		updater.running = true
	}

	function version(list) {
		if(list === "") return []
		return list.trim().split("\n").map(line => {
			const [name, old_verion, , new_version] = line.split(" ")
			const old_parts = old_verion.split(/([:.\-_+])/)
			const new_parts = new_version.split(/([:.\-_+])/)

			let diffIndex = old_parts.findIndex((part, i) => part !== new_parts[i])
			if(diffIndex === -1) diffIndex = old_parts.length

			const unchanged = old_parts.slice(0, diffIndex).join("")
			const changed = new_parts.slice(diffIndex).join("")
			return `${name}: ${unchanged}<font color="#A6DA95">${changed}</font>`
		})
	}

	Process {
		id: checker
		property list<string> packages

		command: ["sh", "-c", "checkupdates; yay -Qua"]
		running: true

		stdout: StdioCollector {
			onStreamFinished: checker.packages = root.version(text)
		}
	}

	Timer {
		interval: 600000
		repeat: true
		running: true

		onTriggered: checker.running = true
	}

	Process {
		id: updater
		command: ["kitty", "nu", "-c", `do --ignore-errors { yay }; print $'${root.prompt}'; input`]

		stdout: StdioCollector {
			onStreamFinished: {
				checker.packages = []
				checker.running = true
			}
		}
	}
}
