import QtQuick
import Quickshell.Services.SystemTray

Row {
	anchors.verticalCenter: parent.verticalCenter
	spacing: 2

	Repeater {
		model: SystemTray.items

		TrayItem {}
	}
}
