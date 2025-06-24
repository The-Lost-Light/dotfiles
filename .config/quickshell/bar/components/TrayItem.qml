import QtQuick
import Quickshell
import Quickshell.Services.SystemTray
import Quickshell.Widgets


IconImage {
	id: icon
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
		id: root

		acceptedButtons: Qt.LeftButton | Qt.RightButton
		anchors.fill: parent

		onClicked: event => {
			if (!icon.modelData.onlyMenu && event.button === Qt.LeftButton)
				icon.modelData.activate();
			else if (icon.modelData.hasMenu)
				menu.open();
		}
	}

	QsMenuAnchor {
		id: menu
		anchor {
			item: icon
			rect.y: icon.y + 16
		}
		menu: icon.modelData.menu
	}
}
