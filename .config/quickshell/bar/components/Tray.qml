import QtQuick
import Quickshell.Services.SystemTray
import Quickshell.Widgets
import qs.services
import qs.configs

Row {
	anchors.verticalCenter: parent.verticalCenter
	spacing: Config.bar.spacing

	Repeater {
		model: SystemTray.items

		IconImage {
			id: item
			required property SystemTrayItem modelData
			asynchronous: true
			implicitSize: Config.bar.trayIconSize
			mipmap: true
			source: Lib.iconResolve(modelData?.icon)

			MouseArea {
				acceptedButtons: Qt.LeftButton | Qt.RightButton
				anchors.fill: parent
				onClicked: event => {
					if(event.button === Qt.LeftButton && !item.modelData.onlyMenu)
						item.modelData.activate()
					else if(item.modelData.hasMenu)
						EventBus.requestTrayPanelToggle(item, item.modelData.menu)
				}
			}
		}
	}
}
