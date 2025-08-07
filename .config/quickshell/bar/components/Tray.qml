pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Controls
import Quickshell.Services.SystemTray
import Quickshell.Widgets
import qs.widgets
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
				let icon = modelData.icon
				if (icon.includes("?path=")) {
					const [name, path] = icon.split("?path=")
					icon = `file://${path}/${name.slice(name.lastIndexOf("/") + 1)}`
				}
				return icon
			}

			MouseArea {
				acceptedButtons: Qt.LeftButton | Qt.RightButton
				anchors.fill: parent
				onClicked: event => {

					if (event.button === Qt.LeftButton && !item.modelData.onlyMenu)
						item.modelData.activate()
					else if (item.modelData.hasMenu) {
						if (menu.trayItem === item && overlay.visible) {
							overlay.visible = false
							menu.clear()
						} else {
							overlay.visible = false
							menu.replaceCurrentItem(subMenu, { menu: item.modelData.menu }, StackView.Immediate)
							menu.trayItem = item
							overlay.visible = true
						}
					}
				}
			}
		}
	}

	OverlayWindow {
		id: overlay

		StackView {
			id: menu
			property Item trayItem
			readonly property point position: trayItem?.mapToItem(null, trayItem.x, trayItem.y) ?? Qt.point(0,0)
			implicitHeight: currentItem?.implicitHeight ?? 0
			implicitWidth: currentItem?.implicitWidth ?? 0
			x: Math.min(position.x - width / 2, Screen.width - width - Config.bar.margin)
			y: Math.min(position.y + Config.bar.height, Screen.height - height)

			background: Rectangle {
				color: "#1e1e2e"
				radius: Config.bar.radius
			}
		}
	}

	Component {
		id: subMenu

		TrayMenu {
			onRequestTrayMenuPush: entry => menu.pushItem(subMenu, { menu: entry, isSubMenu: true }, StackView.Immediate)
			onRequestTrayMenuPop: menu.pop(StackView.Immediate)
			onRequestTrayMenuClose: {
				overlay.visible = false
				menu.clear()
			}
		}
	}
}
