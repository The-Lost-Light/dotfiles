pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Controls
import qs.widgets
import qs.configs

OverlayWindow {
	id: root
	property Item trayItem
	onClosed: root.active = false

	StackView {
		id: stackView
		readonly property point position: root.trayItem?.mapToItem(null, -width / 2, Config.bar.height) ?? Qt.point(0, 0)
		implicitHeight: currentItem?.implicitHeight ?? 0
		implicitWidth: currentItem?.implicitWidth ?? 0
		x: Math.min(position.x, Screen.width - width - Config.bar.horizonMargin)
		y: Math.min(position.y, Screen.height - height)

		background: Rectangle {
			color: Color.background
			radius: Config.bar.radius
		}
	}

	Component {
		id: subMenu

		TrayMenu {
			onRequestTrayMenuPush: entry => stackView.pushItem(subMenu, {
				menu: entry,
				isSubMenu: true
			}, StackView.Immediate)
			onRequestTrayMenuPop: stackView.pop(StackView.Immediate)
			onRequestTrayMenuClose: {
				root.visible = false
				stackView.clear()
			}
		}
	}

	function toggle(trayIcon, menu) {
		if(trayItem === trayIcon && root.visible) {
			root.visible = false
			stackView.clear()
		} else {
			root.visible = false
			stackView.replaceCurrentItem(subMenu, {
				menu: menu
			}, StackView.Immediate)
			trayItem = trayIcon
			root.visible = true
		}
	}
}
