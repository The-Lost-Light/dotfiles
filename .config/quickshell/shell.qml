import QtQuick
import Quickshell
import qs.bar
import qs.osd.power
import qs.osd.tray
import qs.osd.devices

ShellRoot {
	Loader {
		asynchronous: true

		Bar {}

		// OSD
		PowerPanel {}
		TrayPanel {}
		Devices {}
	}
}
