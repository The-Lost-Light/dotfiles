pragma ComponentBehavior: Bound
import QtQuick
import qs.widgets
import qs.configs

Row {
	id: root
	property bool reverse
	property var iconFont
	property color iconColor: Color.font
	property string icon
	property var font
	property color color: Color.font
	property string text
	anchors.verticalCenter: parent.verticalCenter
	layoutDirection: reverse ? Qt.RightToLeft : Qt.LeftToRight

	Loader {
		anchors.verticalCenter: parent.verticalCenter
		active: root.icon
		visible: active

		sourceComponent: QuickLabel {
			font: Qt.font(Object.assign({ family: "lucide" }, root.iconFont))
			color: root.iconColor
			text: root.icon
		}
	}

	Loader {
		anchors.verticalCenter: parent.verticalCenter
		active: root.text
		visible: active

		sourceComponent: QuickLabel {
			font: Qt.font(Object.assign({ family: Config.fontFamily }, root.font))
			color: root.color
			text: root.text
		}
	}
}
