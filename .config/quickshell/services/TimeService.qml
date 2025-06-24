pragma Singleton
import QtQuick
import Quickshell

Singleton {
	readonly property string time: Qt.formatDateTime(clock.date, "h:mm")

	SystemClock {
		id: clock

		precision: SystemClock.Minutes
	}
}
