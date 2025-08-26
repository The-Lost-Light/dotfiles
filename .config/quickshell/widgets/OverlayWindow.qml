pragma ComponentBehavior: Bound
import QtQuick
import Quickshell

LazyLoader {
	id: root
	default property list<QtObject> items

	PanelWindow {
		signal clicked
		anchors {
			top: true
			right: true
			left: true
			bottom: true
		}
		color: "transparent"
		exclusionMode: ExclusionMode.Ignore

		readonly property Item mouseArea: MouseArea {
			acceptedButtons: Qt.AllButtons
			anchors.fill: parent
			onClicked: root.activeAsync = false
		}

		data: [mouseArea, ...root.items]
	}
}
