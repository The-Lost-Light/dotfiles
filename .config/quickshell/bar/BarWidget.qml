pragma ComponentBehavior: Bound

import QtQuick
import Quickshell

Variants {
	id: root
	property Component center
	property Component left
	property Component right
	model: Quickshell.screens

	PanelWindow {
		required property ShellScreen modelData
		anchors {
			left: true
			right: true
			top: true
		}
		color: "transparent"
		implicitHeight: 30
		screen: modelData

		BarSection {
			anchors.left: parent.left
			sourceComponent: root.left
		}

		BarSection {
			anchors.centerIn: parent
			sourceComponent: root.center
		}

		BarSection {
			anchors.right: parent.right
			sourceComponent: root.right
		}
	}
}
