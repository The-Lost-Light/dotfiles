pragma ComponentBehavior: Bound
import QtQuick
import Quickshell.Services.SystemTray
import Quickshell.Widgets

Row {
	anchors.verticalCenter: parent.verticalCenter
	spacing: 2

	Repeater {
		id: repeater
		property QtObject menuInstance: null
		property string menuID: ""
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
					else if (item.modelData.hasMenu && event.button === Qt.RightButton) {
						let sameItem = repeater.menuID === item.modelData.id;
						if (repeater.menuInstance) {
							repeater.menuInstance.destroy();
							repeater.menuInstance = null;
							if (sameItem) repeater.menuID = "";
						}
						if (!sameItem) {
							repeater.menuInstance = menu.createObject(item, {
								parent: item,
								menu: item.modelData.menu
							});
							repeater.menuID = item.modelData.id;
						}
					}
				}
			}
		}
	}

	Component {
		id: menu

		TrayMenu {}
	}
}
