pragma ComponentBehavior: Bound
import QtQuick
import Quickshell
import Quickshell.Widgets

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
			items: root.left
		}

		BarSection {
			anchors.centerIn: parent
			items: root.center
		}

		BarSection {
			anchors {
				right: parent.right
				rightMargin: 8
			}
			items: root.right
		}

		component BarSection: WrapperRectangle {
			property alias items: loader.sourceComponent
			anchors.verticalCenter: parent.verticalCenter
			color: "#1e1e2e"
			implicitHeight: 30
			leftMargin: 8
			rightMargin: 8
			radius: 8

			Loader {
				id: loader
			}
		}
	}
}
