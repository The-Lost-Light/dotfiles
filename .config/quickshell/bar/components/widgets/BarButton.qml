import QtQuick

MouseArea {
	property alias reverse: label.reverse
	property alias iconFont: label.iconFont
	property color iconColor: label.iconColor
	property alias icon: label.icon
	property alias font: label.font
	property alias color: label.color
	property alias text: label.text
	anchors.verticalCenter: parent.verticalCenter
	implicitHeight: label.implicitHeight
	implicitWidth: label.implicitWidth

	BarLabel { id: label }
}
