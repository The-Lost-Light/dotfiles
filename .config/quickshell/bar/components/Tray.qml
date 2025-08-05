pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Services.SystemTray
import Quickshell.Widgets
import qs.config

Row {
	id: root
	anchors.verticalCenter: parent.verticalCenter
	spacing: Config.bar.traySpacing

	Repeater {
		model: SystemTray.items

		IconImage {
			id: item
			required property SystemTrayItem modelData
			asynchronous: true
			implicitSize: Config.bar.trayIconSize
			mipmap: true
			source: {
				if (!modelData) return
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
						if (popup.trayItem === item && popup.visible) {
							popup.visible = false;
							menu.clear();
						} else {
							popup.visible = false;
							menu.replaceCurrentItem(subMenu, { menu: item.modelData.menu }, StackView.Immediate);
							popup.trayItem = item;
							popup.visible = true;
						}
					}
				}
			}
		}
	}

	PopupWindow {
		id: popup
		property Item trayItem
		anchor {
			item: trayItem
			rect {
				x: (trayItem?.width - width) / 2
				y: trayItem?.height + Config.bar.popupOffsetY
			}
		}
		color: "transparent"
		implicitHeight: menu.currentItem?.implicitHeight ?? 1
		implicitWidth: menu.currentItem?.implicitWidth ?? 1

		StackView {
			id: menu
			implicitHeight: menu.currentItem?.implicitHeight ?? 0
			implicitWidth: menu.currentItem?.implicitWidth ?? 0

			background: Rectangle {
				color: "#1e1e2e"
				radius: Config.bar.radius
			}
		}
	}

	Component {
		id: subMenu

		TrayMenu {
			onRequestTrayMenuPush: entry => menu.pushItem(subMenu, { menu: entry, isSubMenu: true }, StackView.Immediate);
			onRequestTrayMenuPop: menu.pop()
			onRequestTrayMenuClose: {
				popup.visible = false;
				menu.clear();
			}
		}
	}
}
