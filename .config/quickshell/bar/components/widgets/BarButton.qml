import QtQuick

MouseArea {
	property alias text: barLabel.text
	anchors.verticalCenter: parent.verticalCenter
	implicitHeight: barLabel.implicitHeight
	implicitWidth: barLabel.implicitWidth

	BarLabel { id: barLabel }
}
