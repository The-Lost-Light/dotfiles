pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Controls
import Quickshell
import qs.services
import qs.widgets
import qs.configs

Scope {
	OverlayWindow {
		id: overlayWindow

		StackView {
			id: stackView
			property point position
			implicitHeight: currentItem?.implicitHeight ?? 0
			implicitWidth: currentItem?.implicitWidth ?? 0
			x: Math.min(position.x - width / 2, Screen.width - width - Config.bar.horizonMargin)
			y: Math.min(position.y, Screen.height - height)

			background: Rectangle {
				color: Color.background
				radius: Config.popupRadius
			}
		}
	}

	Connections {
		target: EventBus

		function onRequestTrayPanelToggle(trayIcon, menu) {
			overlayWindow.activeAsync = true
			stackView.position = trayIcon.mapToItem(null, trayIcon.width / 2, Config.bar.height)
			stackView.replaceCurrentItem(subMenu, {
				menu: menu
			}, StackView.Immediate)
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
			onRequestTrayMenuDestroy: {
				stackView.clear()
				overlayWindow.activeAsync = false
			}
		}
	}
}
