pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
	id: root
	property string prompt: "\x1b[34m\n:: Update Completed!\n\x1b[33m:: Press Enter to exit!\x1b[0m"
	readonly property int updates: checker.packages.length
	readonly property list<string> packages: checker.packages

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

	function version(list) {
		return list.trim().split("\n").map(line => {
			const [name, old_verion, , new_version] = line.split(" ");
			const old_parts = old_verion.split(/([:.\-_+])/);
			const new_parts = new_version.split(/([:.\-_+])/);

			let diffIndex = old_parts.findIndex((part, i) => part !== new_parts[i]);
			if (diffIndex === -1) diffIndex = old_parts.length;

			const unchanged = old_parts.slice(0, diffIndex).join("");
			const changed = new_parts.slice(diffIndex).join("");
			return `${name}: ${unchanged}<font color="#A6DA95">${changed}</font>`;
		});
	}

}
