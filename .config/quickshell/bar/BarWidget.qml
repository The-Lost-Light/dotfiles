pragma ComponentBehavior: Bound

import QtQuick
import Quickshell

Variants {
	id: root
	property Component left
	property Component center
	property Component right
	model: Quickshell.screens

	PanelWindow {
		required property ShellScreen modelData

		anchors {
			top: true
			left: true
			right: true
		}
		color: "transparent"
		implicitHeight: 30
		screen: modelData

		Rectangle {
			anchors.left: parent.left
			anchors.verticalCenter: parent.verticalCenter
			implicitWidth: left_row.implicitWidth
			implicitHeight: left_row.implicitHeight
			color: "#1e1e2e"

			Loader {
				id: left_row
				anchors.left: parent.left
				sourceComponent: root.left
			}
		}

		Rectangle {
			anchors.centerIn: parent
			implicitWidth: center_row.implicitWidth
			implicitHeight: center_row.implicitHeight
			color: "#1e1e2e"

			Loader {
				id: center_row
				sourceComponent: root.center
			}
		}

		Rectangle {
			anchors.right: parent.right
			anchors.verticalCenter: parent.verticalCenter
			implicitWidth: right_row.implicitWidth
			implicitHeight: right_row.implicitHeight
			color: "#1e1e2e"

			Loader {
				id: right_row
				anchors.right: parent.right
				sourceComponent: root.right
			}
		}
	}
}
