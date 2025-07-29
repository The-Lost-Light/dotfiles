import Quickshell.Widgets
import qs.widgets

Popup {
	required property var item
	property alias text: label.text
	parent: item
	child: toolTip
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
