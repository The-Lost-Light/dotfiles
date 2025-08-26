pragma Singleton
import QtQuick
import Quickshell

Singleton {
	signal requestPowerPanelToggle
	signal requestTrayPanelToggle(Item trayIcon, QsMenuHandle menu)
}
