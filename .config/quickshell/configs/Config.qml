pragma Singleton
import Quickshell
import "configs"

Singleton {
	readonly property string fontFamily: "Noto Sans CJK TC"
	readonly property string iconFontFamily: "lucide"

	readonly property int popupMargin: 8
	readonly property int popupRadius: 8

	readonly property Bar bar: Bar {}
	readonly property PowerMenu powerMenu: PowerMenu {}
	readonly property TrayMenu trayMenu: TrayMenu {}
	readonly property Devices devices: Devices {}
}
