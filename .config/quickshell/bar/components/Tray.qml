import QtQuick
import Quickshell.Services.SystemTray

Row {
	spacing: 2

	Repeater {
		implicitHeight: 1
		implicitWidth: 1
		model: SystemTray.items

		TrayItem {}
	}
}
