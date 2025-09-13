pragma Singleton
import QtCore
import Quickshell

Singleton {
	function cachePath(fileName) {
		const path = new URL(StandardPaths.writableLocation(StandardPaths.CacheLocation)).pathname
		if(fileName) return `${path}\\${fileName}`
		else return ""
	}

	function iconResolve(icon) {
		if(icon === undefined) return null

		if(icon?.includes("?path=")) {
			const [name, path] = icon.split("?path=")
			icon = `file://${path}/${name.slice(name.lastIndexOf("/") + 1)}`
		}
		return icon
	}
}
