pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Controls
import Quickshell
import qs.widgets
import qs.config

Column {
	id: column
	signal requestTrayMenuPush (QsMenuHandle entry)
	signal requestTrayMenuPop
	signal requestTrayMenuClose
	property alias menu: menuOpener.menu
	property bool isSubMenu: false
	padding: children.length > 2 ? Config.bar.popupMargin : 0

	QsMenuOpener {
		id: menuOpener
		onChildrenChanged: if (column.isSubMenu && children.values.length === 0) column.requestTrayMenuPop()
	}

	Repeater {
		model: menuOpener.children

		Loader {
			id: loader
			required property QsMenuEntry modelData
			asynchronous: true
			sourceComponent: {
				let entry = modelData
				if (entry.isSeparator) return separator
				switch (entry.buttonType) {
					case QsMenuButtonType.CheckBox:	return checkBox
					case QsMenuButtonType.RadioButton: return radioButton
					default: return button
				}
			}

			Component {
				id: separator
				Item {
					implicitHeight: Config.bar.trayMenuSeparator
					implicitWidth: 1
				}
			}

			Component {
				id: button

				Button {
					property QsMenuEntry entry: loader.modelData
					background: null
					enabled: entry.enabled
					icon {
						height: Config.bar.trayMenuIconSize
						source: entry.icon
					}
					text: entry.text
					onClicked: column.trigger(entry)
				}
			}

			Component {
				id: checkBox

				CheckBox {
					id: cb
					property QsMenuEntry entry: loader.modelData
					background: null
					tristate: true
					checkState: entry.checkState
					enabled: entry.enabled
					icon {
						height: Config.bar.trayMenuIconSize
						source: entry.icon
					}
					text: entry.text
					indicator: Indicator {
						entry: cb.entry
					}
					onClicked: column.trigger(entry)
				}
			}

			Component {
				id: radioButton

				RadioButton {
					id: rb
					property QsMenuEntry entry: loader.modelData
					background: null
					checked: entry.checkState > 0
					enabled: entry.enabled
					icon {
						height: Config.bar.trayMenuIconSize
						source: entry.icon
					}
					text: entry.text
					indicator: Indicator {
						entry: rb.entry
					}
					onClicked: column.trigger(entry)
				}
			}
		}
	}

	Loader {
		active: column.isSubMenu
		sourceComponent: Button {
			background: null
			text: "Back"
			onClicked: column.requestTrayMenuPop()
		}
	}

	component Indicator: Circle {
		id: indicator
		required property QsMenuEntry entry
		anchors.verticalCenter: parent.verticalCenter
		color: "white"
		border.color: entry.checkState ? "dodgerblue" : "gray"
		border.width: 1
		x: 4
		radius: 8

		Circle {
			anchors.centerIn: parent
			color: "dodgerblue"
			radius: 4
			visible: indicator.entry.checkState
		}
	}

	function trigger(entry) {
		entry.triggered()
		if (entry.hasChildren) requestTrayMenuPush(entry)
		else requestTrayMenuClose()
	}
}
