pragma Singleton
import Quickshell
import Quickshell.Io

Singleton {
	id: root
	readonly property string percent: process.text

	Process {
		id: process
		property string text: "Not found brightness!"
		command: ["sh", "-c", "~/.config/niri/scripts/brightness.nu"]
		running: true
		stdout: StdioCollector {
			onStreamFinished: process.text = `󰃟${text.trim()}`
		}
	}

	function script(command) {
		process.exec(["sh", "-c", `~/.config/niri/scripts/brightness.nu ${command}`])
	}
}
