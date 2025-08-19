import Quickshell
import Quickshell.Widgets
import qs.configs

PopupWindow {
	required property var item
	property alias text: label.text
	anchor {
		item: item
		rect {
			x: (item.width - width) / 2
			y: item.height + Config.bar.popupOffsetY
		}
	}
	color: "transparent"
	implicitHeight: toolTip.implicitHeight
	implicitWidth: toolTip.implicitWidth
	visible: item.containsMouse

	WrapperRectangle {
		id: toolTip
		color: Color.background
		margin: Config.bar.popupMargin
		radius: Config.bar.radius

		BarLabel {
			id: label
		}
	}
}
