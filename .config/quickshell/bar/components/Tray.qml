pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Services.SystemTray
import Quickshell.Widgets

Row {
	id: root
	anchors.verticalCenter: parent.verticalCenter
	spacing: 2

	Repeater {
		model: SystemTray.items

		IconImage {
			id: item
			required property SystemTrayItem modelData
			asynchronous: true
			implicitSize: 18
			mipmap: true
			source: {
				let icon = modelData.icon;
				if (icon.includes("?path=")) {
					const [name, path] = icon.split("?path=");
					icon = `file://${path}/${name.slice(name.lastIndexOf("/") + 1)}`;
				}
				return icon;
			}

			MouseArea {
				acceptedButtons: Qt.LeftButton | Qt.RightButton
				anchors.fill: parent
				onClicked: event => {
					if (event.button === Qt.LeftButton && !item.modelData.onlyMenu)
						item.modelData.activate();
					else if (item.modelData.hasMenu) {
						if (popup.trayItem === item) root.trayMenuClose()
						else {
							popup.trayItem = item
							menu.replaceCurrentItem(subMenu, { menu: item.modelData.menu }, StackView.Immediate);
						}
					}
				}
			}
		}
	}

	PopupWindow {
		id: popup
		property Item trayItem: root
		anchor {
			item: root
			rect {
				x: trayItem.x + (trayItem.width - width) / 2
				y: trayItem.y + trayItem.height + 8
			}
		}
		color: "transparent"
		implicitHeight: menu.currentItem?.implicitHeight ?? 1
		implicitWidth: menu.currentItem?.implicitWidth ?? 1
		visible: !menu.empty

		StackView {
			id: menu
			anchors.fill: parent

			background: Rectangle {
				color: "#1e1e2e"
				radius: 8
			}
		}
	}

	Component {
		id: subMenu

		TrayMenu {
			onRequestTrayMenuPush: entry => menu.pushItem(subMenu, { menu: entry, isSubMenu: true }, StackView.Immediate);
			onRequestTrayMenuPop: menu.pop()
			onRequestTrayMenuClose: root.trayMenuClose()
		}
	}

	function trayMenuClose() {
		menu.clear()
		popup.trayItem = root
	}
}
