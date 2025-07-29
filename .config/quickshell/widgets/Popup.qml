import QtQuick
import Quickshell

PopupWindow {
	id: root
	required property Item parent
	required property Item child

	anchor {
		item: root.parent
		rect {
			x: (root.parent.width - width) / 2
			y: root.parent.height + 8
		}
	}
	color: "transparent"
	implicitWidth: child.implicitWidth
	implicitHeight: child.implicitHeight
}
