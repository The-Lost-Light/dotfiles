pragma ComponentBehavior: Bound

import QtQuick
import Quickshell

Variants {
	id: root

	property list<Item> left
	property list<Item> center
	property list<Item> right

	model: Quickshell.screens;


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
			color: "#1e1e2e"

			Row {
				anchors.left: parent.left
				data: root.left
			}
		}
		Rectangle {
			anchors.centerIn: parent
			color: "#1e1e2e"

			Row {
				anchors.centerIn: parent
				data: root.center
			}
		}
		Rectangle {
			anchors.right: parent.right
			color: "#1e1e2e"

			Row {
				anchors.right: parent.right
				data: root.right
			}
		}
	}
}
