pragma ComponentBehavior: Bound
import QtQuick
import Quickshell
import qs.config

PanelWindow {
	id: root
	default required property list<PowerButton> buttons
	anchors.right: true
	color: "transparent"
	exclusionMode: ExclusionMode.Ignore
	implicitHeight: column.implicitHeight
	implicitWidth: column.implicitWidth
	margins.right: Config.powerMenu.margin

	Column {
		id: column
		spacing: Config.powerMenu.spacing
		children: root.buttons
	}
}
