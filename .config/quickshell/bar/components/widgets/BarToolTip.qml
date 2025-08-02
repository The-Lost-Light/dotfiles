import Quickshell
import Quickshell.Widgets

PopupWindow {
	required property var item
	property alias text: label.text
	anchor {
		item: item
		rect {
			x: (item.width - width) / 2
			y: item.height + 8
		}
	}
	color: "transparent"
	implicitHeight: toolTip.implicitHeight
	implicitWidth: toolTip.implicitWidth
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
