pragma Singleton
import Quickshell

Singleton {
	function iconResolve(icon) {
		if(icon === undefined) return null

		if(icon?.includes("?path=")) {
			const [name, path] = icon.split("?path=")
			icon = `file://${path}/${name.slice(name.lastIndexOf("/") + 1)}`
		}
		return icon
	}
}
