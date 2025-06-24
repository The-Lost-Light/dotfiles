import QtQuick
import Quickshell

PanelWindow {
	id: root

	default required property list<PowerButton> buttons
	required property QtObject menu_

	anchors.right: true
	color: "transparent"
	contentItem.palette.buttonText: "white"
	implicitHeight: column.implicitHeight
	implicitWidth: column.implicitWidth
	margins.right: 16

	Column {
		id: column

		spacing: 16

		Repeater {
			model: root.buttons

			ButtonWidget { menu: menu_ }
		}
	}
}
