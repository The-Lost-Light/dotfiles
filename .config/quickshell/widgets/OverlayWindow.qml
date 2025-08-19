import QtQuick
import Quickshell

PanelWindow {
	id: root
	signal clicked
	anchors {
		top: true
		right: true
		left: true
		bottom: true
	}
	color: "transparent"
	exclusionMode: ExclusionMode.Ignore
	visible: false

	MouseArea {
		id: mouseArea
		acceptedButtons: Qt.AllButtons
		anchors.fill: parent
		onClicked: {
			root.visible = false
			root.clicked()
		}
	}
}
