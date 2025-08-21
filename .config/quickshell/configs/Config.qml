pragma Singleton
import Quickshell
import "configs"

Singleton {
	readonly property string fontFamily: "Noto Sans CJK TC"

	readonly property Bar bar: Bar {}
	readonly property PowerMenu powerMenu: PowerMenu {}
	readonly property TrayMenu trayMenu: TrayMenu {}
}
