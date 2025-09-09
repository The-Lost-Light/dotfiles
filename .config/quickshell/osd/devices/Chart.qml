import QtQuick
import Quickshell.Widgets
import qs.widgets
import qs.configs

WrapperRectangle {
	id: root
	property alias iconFont: icon.font
	property alias icon: icon.text
	required property real percent
	readonly property real size: Math.max(content.implicitWidth, content.implicitHeight) + 2 * margin + 2 * extraMargin
	border {
		color: Color.border
		width: Config.devices.borderWidth
	}
	color: Color.background
	margin: Config.popupMargin
	topMargin: Config.popupMargin + Config.devices.marginOffset
	extraMargin: Config.devices.borderWidth
	radius: Config.popupRadius
	implicitWidth: size
	implicitHeight: size

	Column {
		id: content
		spacing: Config.devices.contentSpacing

		RadioBar {
			anchors.horizontalCenter: parent.horizontalCenter
			backgroundColor: Color.devices.ringBackground
			color: Color.devices.ringForeground
			radius: Config.devices.radius
			thickness: Config.devices.thickness
			percent: root.percent

			QuickLabel {
				id: icon
				anchors.centerIn: parent
			}
		}

		QuickLabel {
			anchors.horizontalCenter: parent.horizontalCenter
			text: Math.round(root.percent) + "%"
		}
	}
}
