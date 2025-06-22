import QtQuick
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.SystemTray

// IconImage {
// 	id: root

// 	required property SystemTrayItem modelData

// 	source: modelData.icon
// 	asynchronous: true
// 	implicitSize: 18
// 	mipmap: true

// 	MouseArea {
// 		anchors.fill: parent
// 		acceptedButtons: Qt.LeftButton | Qt.RightButton
// 		onClicked: event => {
// 			switch (event.button) {
// 				case Qt.LeftButton: {
// 					root.modelData.activate()
// 					break
// 				}
// 				case Qt.RightButton: {
// 					if (root.modelData.hasMenu) {
// 						const window = QsWindow.window
// 						menu.anchor.rect = window.contentItem.mapFromItem(root, 80, root.height + 10 , root.width, root.height)
// 						menu.open()
// 					}
// 					break
// 				}
// 			}
// 		}
// 	}

// 	QsMenuAnchor {
// 		id: menu
// 		menu: root.modelData.menu
// 		anchor.window: root.QsWindow.window

// 	}
// }

MouseArea {
    id: root
    required property SystemTrayItem modelData
    acceptedButtons: Qt.LeftButton | Qt.RightButton
    onClicked: event => {
        if (event.button === Qt.LeftButton)
            modelData.activate();
        else if (modelData.hasMenu)
            menu.open();
    }
    implicitWidth: icon.implicitWidth
    implicitHeight: icon.implicitHeight

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
        menu: root.modelData.menu
        anchor.window: root.QsWindow.window
    }
}
