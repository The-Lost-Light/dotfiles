pragma Singleton
import QtQuick
import Quickshell

Singleton {
	readonly property string time: Qt.formatDateTime(clock.date, "h:mm")
	readonly property string date: Qt.formatDateTime(clock.date, "yyyy/M/d ddd")

	SystemClock {
		id: clock
		precision: SystemClock.Minutes
	}
}
