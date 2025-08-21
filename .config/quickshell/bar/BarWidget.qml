pragma ComponentBehavior: Bound
import QtQuick
import Quickshell
import Quickshell.Widgets
import qs.configs

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
		implicitHeight: Config.bar.height
		margins {
			top: Config.bar.verticalMargin
			bottom: Config.bar.verticalMargin
		}
		screen: modelData

		BarSection {
			anchors{
				left: parent.left
				leftMargin: Config.bar.horizonMargin
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
				rightMargin: Config.bar.horizonMargin
			}
			items: root.right
		}

		component BarSection: WrapperRectangle {
			property alias items: loader.sourceComponent
			anchors.verticalCenter: parent.verticalCenter
			color: Color.background
			implicitHeight: Config.bar.height
			leftMargin: Config.bar.horizonMargin
			rightMargin: Config.bar.horizonMargin
			radius: Config.bar.radius

			Loader { id: loader	}
		}
	}
}
