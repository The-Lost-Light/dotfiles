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

		contentItem.palette.buttonText: "white"

		Rectangle {
			anchors.left: parent.left
			anchors.verticalCenter: parent.verticalCenter
			color: "#1e1e2e"
			implicitHeight: left_row.implicitHeight
			implicitWidth: left_row.implicitWidth + 16
			radius: 16

			Loader {
				id: left_row
				anchors.centerIn: parent
				sourceComponent: root.left
			}
		}

		Rectangle {
			anchors.centerIn: parent
			color: "#1e1e2e"
			implicitHeight: center_row.implicitHeight
			implicitWidth: center_row.implicitWidth + 16
			radius: 16

			Loader {
				id: center_row
				anchors.centerIn: parent
				sourceComponent: root.center
			}
		}

		Rectangle {
			anchors.right: parent.right
			anchors.verticalCenter: parent.verticalCenter
			color: "#1e1e2e"
			implicitHeight: right_row.implicitHeight
			implicitWidth: right_row.implicitWidth + 16
			radius: 16

			Loader {
				id: right_row
				anchors.centerIn: parent
				sourceComponent: root.right
			}
		}
	}
}
