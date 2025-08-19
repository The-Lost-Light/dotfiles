pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.widgets
import qs.configs

ColumnLayout {
	id: column
	signal requestTrayMenuPush(QsMenuEntry entry)
	signal requestTrayMenuPop
	signal requestTrayMenuClose
	property alias menu: menuOpener.menu
	property bool isSubMenu: false
	spacing: Config.trayMenu.spacing

	QsMenuOpener {
		id: menuOpener
		onChildrenChanged: if(column.isSubMenu && children.values.length === 0) column.requestTrayMenuPop()
	}

	Separator {}

	Repeater {
		id: repeater
		model: {
		    const entrys = menuOpener.children.values
		    let end = entrys.length
		    while (end > 0 && entrys[end-1].isSeparator) end--
		    return entrys.slice(0, end)
		}

		Loader {
			id: loader
			required property int index
			required property QsMenuEntry modelData
			asynchronous: true
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
						if(entry.hasChildren) column.requestTrayMenuPush(entry)
						else column.requestTrayMenuClose()
					}
				}
			}
		}
	}

	Loader {
		active: column.isSubMenu
		visible: active
		Layout.fillWidth: true
		sourceComponent: QsLabel {
			text: "Back"
			leftPadding: Config.trayMenu.padding
			rightPadding: Config.trayMenu.padding

			MouseArea {
				anchors.fill: parent
				onClicked: column.requestTrayMenuPop()
			}
		}
	}

	Separator {}

	component Separator: Item {
		implicitHeight: Config.trayMenu.separator
		implicitWidth: 1
	}
}
