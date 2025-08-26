pragma Singleton
import QtQuick
import Quickshell
import "colors"

Singleton {
	readonly property color background: "#1e1e2e"
	readonly property color border: "#4a4a57"
	readonly property color font: "white"

	readonly property color red: "#dd6777"

	readonly property PowerMenu powerMenu: PowerMenu {}
	readonly property TrayMenu trayMenu: TrayMenu {}
	readonly property Devices devices: Devices {}
	// Arch
}
