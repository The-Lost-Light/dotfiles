import QtQuick
import Quickshell.Services.SystemTray
import Quickshell.Widgets

Row {
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
					if (!item.modelData.onlyMenu && event.button === Qt.LeftButton)
						item.modelData.activate();
					else if (item.modelData.hasMenu && event.button === Qt.RightButton)
						menu.toggle();
				}
			}

			TrayMenu {
				id: menu
				parent: item
				menu: item.modelData.menu
			}
		}
	}
}
