import QtQuick
import Quickshell.Services.UPower

Text {
	color: "white"
	text: `${UPower.displayDevice.percentage * 100}%  `

	font {
		family: "Symbols Nerd Font"
		pixelSize: 16
	}
}
