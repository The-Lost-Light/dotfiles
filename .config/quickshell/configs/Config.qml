pragma Singleton
import Quickshell
import "configs"

Singleton {
	readonly property Bar bar: Bar {}
	readonly property PowerMenu powerMenu: PowerMenu {}
	readonly property TrayMenu trayMenu: TrayMenu {}
}
