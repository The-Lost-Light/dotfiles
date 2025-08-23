pragma ComponentBehavior: Bound
import QtQuick
import qs.widgets
import qs.configs

Row {
	id: root
	property bool reverse
	property var iconFont
	property string icon
	property var font
	property string text
	anchors.verticalCenter: parent.verticalCenter
	layoutDirection: reverse ? Qt.RightToLeft : Qt.LeftToRight

	Loader {
		anchors.verticalCenter: parent.verticalCenter
		active: root.icon

		sourceComponent: QuickLabel {
			font: Qt.font(Object.assign({ family: "lucide" }, root.iconFont))
			text: root.icon
		}
	}

	Loader {
		anchors.verticalCenter: parent.verticalCenter
		active: root.text

		sourceComponent: QuickLabel {
			id: test
			font: Qt.font(Object.assign({ family: Config.fontFamily }, root.font))
			text: root.text
		}
	}
}
