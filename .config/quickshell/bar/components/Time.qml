import Quickshell
import Quickshell.Widgets
import "root:services"
import "widgets"

BarMouseLabel {
	id: root
	hoverEnabled: true
	text: TimeService.time

	PopupWindow {
		anchor {
			item: root
			rect {
				x: (root.width - width) / 2
				y: root.height + 8
			}
		}
		color: "transparent"
		implicitWidth: toolTip.implicitWidth
		implicitHeight: toolTip.implicitHeight
		visible: root.containsMouse

		WrapperRectangle {
			id: toolTip
			color: "#1e1e2e"
			margin: 8
			radius: 8

			BarLabel {
				text: TimeService.date
			}
		}
	}
}
