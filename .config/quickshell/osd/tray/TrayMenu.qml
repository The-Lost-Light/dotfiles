pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.widgets
import qs.configs

ColumnLayout {
	id: root
	signal requestTrayMenuPush(QsMenuEntry entry)
	signal requestTrayMenuPop
	signal requestTrayMenuDestroy
	property alias menu: menuOpener.menu
	property bool isSubMenu: false
	spacing: Config.trayMenu.spacing

	QsMenuOpener {
		id: menuOpener
		onChildrenChanged: if(root.isSubMenu && children.values.length === 0) root.requestTrayMenuPop()
	}

	Separator {
		visible: repeater.count > 0
		implicitHeight: Config.trayMenu.verticalPadding
	}

	Repeater {
		id: repeater
		readonly property int endIndex: {
			let index = menuOpener.children.values.length
			while (index > 0 && menuOpener.children.values[index - 1].isSeparator) index--
			return index
		}
		model: menuOpener.children

		Loader {
			id: loader
			required property int index
			required property QsMenuEntry modelData
			asynchronous: true
			visible: index < repeater.endIndex
			Layout.fillWidth: true
			sourceComponent: {
				if(modelData.isSeparator) return separator
				else return menuButton
			}

			Component {
				id: separator

				Separator {}
			}

			Component {
				id: menuButton

				MenuButton {
					entry: loader.modelData
					onMenuTrigger: entry => {
						entry.triggered()
						if(entry.hasChildren) root.requestTrayMenuPush(entry)
						else root.requestTrayMenuDestroy()
					}
				}
			}
		}
	}

	Loader {
		active: root.isSubMenu
		visible: active
		Layout.fillWidth: true
		sourceComponent: QuickLabel {
			text: "Back"
			leftPadding: Config.trayMenu.horizontalPadding
			rightPadding: Config.trayMenu.horizontalPadding

			MouseArea {
				anchors.fill: parent
				onClicked: root.requestTrayMenuPop()
			}
		}
	}

	Separator {
		visible: repeater.count > 0
		implicitHeight: Config.trayMenu.verticalPadding
	}

	component Separator: Item {
		implicitHeight: Config.trayMenu.separator
		implicitWidth: 1
	}
}
