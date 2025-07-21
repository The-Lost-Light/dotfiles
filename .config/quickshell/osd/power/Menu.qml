pragma ComponentBehavior: Bound
import QtQuick
import Quickshell

PanelWindow {
	id: root
	default required property list<PowerButton> buttons
	anchors.right: true
	color: "transparent"
	exclusionMode: ExclusionMode.Ignore
	implicitHeight: column.implicitHeight
	implicitWidth: column.implicitWidth
	margins.right: 16

	Column {
		id: column
		spacing: 16
		children: root.buttons
	}
}
