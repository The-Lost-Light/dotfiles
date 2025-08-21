pragma ComponentBehavior: Bound
import QtQuick

MouseArea {
	id: root
	property alias reverse: label.reverse
	property alias iconFont: label.iconFont
	property alias icon: label.icon
	property alias text: label.text
	anchors.verticalCenter: parent.verticalCenter
	implicitHeight: label.implicitHeight
	implicitWidth: label.implicitWidth

	BarLabel { id: label }
}
