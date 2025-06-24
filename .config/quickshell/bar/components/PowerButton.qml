import QtQuick
import QtQuick.Controls
import Quickshell
import "root:osd/power"

Button {
	font.pixelSize: 16
	text: "⏻ "

	background: Rectangle {
		color: "transparent"
	}

	onClicked: power_menu.activeAsync = !power_menu.activeAsync

	LazyLoader {
		id: power_menu
		PowerMenu {	menu: power_menu }
	}
}
