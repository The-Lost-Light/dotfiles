import QtQuick
import Quickshell
import Quickshell.Services.SystemTray
import Quickshell.Widgets

MouseArea {
	id: root

	required property SystemTrayItem modelData

	acceptedButtons: Qt.LeftButton | Qt.RightButton
	implicitHeight: icon.implicitHeight
	implicitWidth: icon.implicitWidth

	onClicked: event => {
		if (event.button === Qt.LeftButton)
			modelData.activate();
		else if (modelData.hasMenu)
			menu.open();
	}

	IconImage {
		id: icon

		asynchronous: true
		implicitSize: 18
		mipmap: true
		source: {
			let icon = root.modelData.icon;
			if (icon.includes("?path=")) {
				const [name, path] = icon.split("?path=");
				icon = `file://${path}/${name.slice(name.lastIndexOf("/") + 1)}`;
			}
			return icon;
		}
	}

	QsMenuAnchor {
		id: menu

		anchor {
			item: root
			rect.y: root.y + 16
		}
		menu: root.modelData.menu
	}
}
