import QtQuick
import Quickshell
import Quickshell.Services.SystemTray
import Quickshell.Widgets

IconImage {
	id: root
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
			if (!root.modelData.onlyMenu && event.button === Qt.LeftButton)
				root.modelData.activate();
			else if (root.modelData.hasMenu && event.button === Qt.RightButton)
				menu.open();
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
