pragma Singleton
import QtQuick
import Quickshell
import "colors"

Singleton {
	readonly property PowerMenu powerMenu: PowerMenu {}
	readonly property TrayMenu trayMenu: TrayMenu {}

	readonly property color background: "#1e1e2e"

	// Arch

	readonly property color red: "#dd6777"
}
