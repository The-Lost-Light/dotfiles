import QtQuick
import Quickshell

PanelWindow {
	id: root
	anchors.right: true
	margins.right: 16
	color: "transparent"
	implicitWidth: column.implicitWidth
    implicitHeight: column.implicitHeight

	default required property list<Button> buttons

	Column {
		id: column
		spacing: 16

		Repeater {
			model: root.buttons

			ButtonWidget {}
		}
	}
}
