import QtQuick

BarLabel {
	id: root
	signal clicked
	signal wheel(WheelEvent  event)
	property alias hoverEnabled: mouse_area.hoverEnabled
	property alias containsMouse: mouse_area.containsMouse

	MouseArea {
		anchors.fill: parent
		id: mouse_area
		onClicked: root.clicked()
		onWheel: event => parent.wheel(event)
	}
}
