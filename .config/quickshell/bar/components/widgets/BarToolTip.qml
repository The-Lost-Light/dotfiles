import Quickshell.Widgets
import qs.widgets

Popup {
	required property var item
	property alias text: label.text
	implicitHeight: toolTip.implicitHeight
	implicitWidth: toolTip.implicitWidth
	parent: item
	visible: item.containsMouse

	WrapperRectangle {
		id: toolTip
		color: "#1e1e2e"
		margin: 8
		radius: 8

		BarLabel {
			id: label
		}
	}
}
