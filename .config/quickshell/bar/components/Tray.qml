import QtQuick
import Quickshell.Services.SystemTray

Row {
	spacing: 2

	Repeater {
		model: SystemTray.items

		TrayItem {}
	}
}
