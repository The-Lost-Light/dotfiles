pragma ComponentBehavior: Bound
import QtQuick
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Widgets
import qs.services
import qs.widgets
import qs.configs

Scope {
	id: root
	property real percent

	Behavior on percent {
		SmoothedAnimation {
			velocity: Config.devices.animationVelocity
			duration: Config.devices.animationMaxDuration
			easing.type: Easing.OutCubic
		}
	}

	LazyLoader {
		id: loader
		activeAsync: false

		PanelWindow {
			anchors {
				right: true
				bottom: true
			}
			color: "transparent"
			implicitHeight: wrapperRectangle.implicitHeight
			implicitWidth: wrapperRectangle.implicitWidth

			margins {
				right: Config.devices.marginRight
				bottom: Config.devices.marginBottom
			}
			mask: Region {}

			WrapperRectangle {
				id: wrapperRectangle
				readonly property real size: Math.max(column.implicitWidth, column.implicitHeight) + 2 * margin + 2 * extraMargin
				border {
					color: Color.border
					width: Config.devices.borderWidth
				}
				color: Color.background
				margin: Config.popupMargin
				extraMargin: Config.devices.borderWidth
				radius: Config.popupRadius
				implicitWidth: size
				implicitHeight: size

				Column {
					id: column
					spacing: Config.devices.contentSpacing

					RadioBar {
						anchors.horizontalCenter: parent.horizontalCenter
						percent: root.percent
						backgroundColor: Color.devices.ringBackground
						color: Color.devices.ringForeground
						radius: Config.devices.radius
						thickness: Config.devices.thickness

						QuickLabel {
							anchors.centerIn: parent
							text: ''
						}
					}

					QuickLabel {
						anchors.horizontalCenter: parent.horizontalCenter
						text: Math.round(Pipewire.defaultAudioSink?.audio.volume * 100 ?? 0) + "%"
					}
				}
			}
		}
	}

	Connections {
		target: AudioService

		function onSinkAudioChanged() {
			root.percent = Pipewire.defaultAudioSink?.audio.volume * 100 ?? 0
			loader.active = true
			hideTimer.restart()
		}
	}

	Timer {
		id: hideTimer
		interval: 1000
		onTriggered: loader.activeAsync = false
	}
}
