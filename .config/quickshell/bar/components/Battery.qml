import QtQuick
import Quickshell.Services.UPower

MouseArea {
	implicitHeight: text.implicitHeight
	implicitWidth: text.implicitWidth

	Text {
		id: text

		color: "#fff"
		text: `${UPower.displayDevice.percentage * 100}%  `

		font {
			family: "Symbols Nerd Font"
			pixelSize: 16
		}
	}
}
