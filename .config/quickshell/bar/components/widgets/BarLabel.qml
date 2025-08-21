pragma ComponentBehavior: Bound
import QtQuick
import qs.widgets

Row {
	id: root
	property bool reverse
	property string iconFont
	property string icon
	property string text
	anchors.verticalCenter: parent.verticalCenter
	layoutDirection: reverse ? Qt.RightToLeft : Qt.LeftToRight

	Loader {
		anchors.verticalCenter: parent.verticalCenter
		active: root.icon

		sourceComponent: QsLabel {
			font.family: root.iconFont
			text: root.icon
		}
	}

	Loader {
		anchors.verticalCenter: parent.verticalCenter
		active: root.text

		sourceComponent: QsLabel {
			text: root.text
		}
	}
}
