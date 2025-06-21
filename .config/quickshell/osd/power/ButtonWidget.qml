import QtQuick

Rectangle {
	required property Button modelData;

	implicitWidth: 96
	implicitHeight: 96
	radius: 16
	color: {
		if (mouse_area.pressed) return "#242933"
		else if (mouse_area.containsMouse) return "#292e39"
		else return "#2e3440"
	}

	Text {
		anchors.centerIn: parent
		color: "#fff"
		font {
			bold: true
			family: "Symbols Nerd Font"
			pixelSize: 48
		}
		text: parent.modelData.text
	}

	MouseArea {
		id: mouse_area
		anchors.fill: parent
		hoverEnabled: true
		onClicked: parent.modelData.exec()
	}
}
