import QtQuick
import Quickshell.Widgets

WrapperRectangle {
	default property alias sourceComponent: loader.sourceComponent
	anchors.verticalCenter: parent.verticalCenter
	color: "#1e1e2e"
	leftMargin: 8
	rightMargin: 8
	radius: 16

	Loader {
		id: loader
	}
}
