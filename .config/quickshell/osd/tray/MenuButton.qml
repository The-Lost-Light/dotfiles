import QtQuick
import Quickshell
import Quickshell.Widgets
import qs.services
import qs.widgets
import qs.configs

MouseArea {
	id: root
	signal menuTrigger(QsMenuEntry entry)
	required property QsMenuEntry entry
	enabled: entry.enabled
	implicitHeight: row.implicitHeight
	implicitWidth: row.implicitWidth
	onClicked: menuTrigger(entry)

	Row {
		id: row
		spacing: 4
		leftPadding: Config.trayMenu.padding
		rightPadding: Config.trayMenu.padding

		Indicator {
			readonly property int buttonType: root.entry.buttonType
			readonly property int checkState: root.entry.checkState
			anchors.verticalCenter: parent.verticalCenter
			visible: buttonType === QsMenuButtonType.CheckBox || buttonType === QsMenuButtonType.RadioButton
			checked: checkState === Qt.PartiallyChecked || checkState === Qt.Checked
		}

		IconImage {
			anchors.verticalCenter: parent.verticalCenter
			asynchronous: true
			implicitSize: Config.trayMenu.iconSize
			mipmap: true
			visible: root.entry.icon
			source: Lib.iconResolve(root.entry.icon)
		}

		QsLabel {
			anchors.verticalCenter: parent.verticalCenter
			color: root.entry.enabled ? Color.trayMenu.label : Color.trayMenu.disableLabel
			text: root.entry.text
		}
	}

	component Indicator: Circle {
		id: indicator
		required property bool checked

		color: Color.trayMenu.indicatorBackground
		border.color: checked ? Color.trayMenu.checked : Color.trayMenu.unchecked
		border.width: 1
		radius: Config.trayMenu.indicatorOutsideRadius

		Circle {
			anchors.centerIn: parent
			color: Color.trayMenu.checked
			radius: Config.trayMenu.indicatorInsideRadius
			visible: indicator.checked
		}
	}
}
