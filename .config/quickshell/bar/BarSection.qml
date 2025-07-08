import QtQuick
import Quickshell.Widgets

WrapperRectangle {
	default property alias sourceComponent: loader.sourceComponent
	anchors.verticalCenter: parent.verticalCenter
	color: "#1e1e2e"
	implicitHeight: 30
	leftMargin: 8
	rightMargin: 8
	radius: 8

	Loader {
		id: loader
	}
}
