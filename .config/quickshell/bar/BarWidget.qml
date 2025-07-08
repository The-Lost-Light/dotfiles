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
		implicitHeight: 40
		screen: modelData

		BarSection {
			anchors{
				left: parent.left
				leftMargin: 8
			}
			sourceComponent: root.left
		}

		BarSection {
			anchors.centerIn: parent
			sourceComponent: root.center
		}

		BarSection {
			anchors {
				right: parent.right
				rightMargin: 8
			}
			sourceComponent: root.right
		}
	}
}
