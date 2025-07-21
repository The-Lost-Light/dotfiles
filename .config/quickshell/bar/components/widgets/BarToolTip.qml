import Quickshell
import Quickshell.Widgets

PopupWindow {
	id: root
	required property BarMouseLabel item
	property alias text: label.text

	anchor {
		item: root.item
		rect {
			x: (root.item.width - width) / 2
			y: root.item.height + 8
		}
	}
	color: "transparent"
	implicitWidth: toolTip.implicitWidth
	implicitHeight: toolTip.implicitHeight
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
