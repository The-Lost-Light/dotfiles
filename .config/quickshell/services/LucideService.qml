pragma ComponentBehavior: Bound
pragma Singleton
import Quickshell
import Quickshell.Io
import qs.services

Singleton {
	id: root
	readonly property var json: fileView.data
	property string lucideURL: "https://unpkg.com/lucide-static/font/info.json"
	property string cachePath: Lib.cachePath("lucide.json")

	Process {
		running: true
		command: ["curl", "--fail", "--location", root.lucideURL, "--output", root.cachePath]
		onExited: exitCode => {
			if(exitCode === 0) fileView.reload()
		}
	}

	FileView {
		id: fileView
		property var data
		blockLoading: true
		path: root.cachePath
		onLoaded: data = JSON.parse(fileView.text())
	}

	function unicode(name) {
		return String.fromCodePoint(LucideService.json?.[name].unicode.replace(/^&#(\d+);$/, "$1") ?? "")
	}
}
