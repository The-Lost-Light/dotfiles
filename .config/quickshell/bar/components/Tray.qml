import QtQuick
import Quickshell.Services.SystemTray
import "widgets"

Row {
	anchors.verticalCenter: parent.verticalCenter
	spacing: 2

	Repeater {
		model: SystemTray.items

		BarTrayItem {}
	}
}
