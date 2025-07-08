import QtQuick

BarLabel {
	id: root
	signal clicked
	signal wheel(WheelEvent  event)
	property alias hoverEnabled: mouseArea.hoverEnabled
	property alias containsMouse: mouseArea.containsMouse

	MouseArea {
		anchors.fill: parent
		id: mouseArea
		onClicked: root.clicked()
		onWheel: event => parent.wheel(event)
	}
}
