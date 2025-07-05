import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Services.Greetd

ShellRoot {
	id: root

	PanelWindow {
		anchors {
			right: true
			bottom: true
			top: true
			left: true
		}
		color: "transparent"
		exclusionMode: ExclusionMode.Ignore
		focusable: true

		Image {
			anchors.fill: parent
			source: "/etc/greetd/login.png"
			fillMode: Image.PreserveAspectCrop
			z: -1
		}

		Column {
			anchors.centerIn: parent

			TextField {
				id: username
				anchors.horizontalCenter: parent.horizontalCenter
				focus: true
				placeholderText: "Username"
				onAccepted: {
					if (text.length > 0) password.focus = true
				}
			}

			TextField {
				id: password
				anchors.horizontalCenter: parent.horizontalCenter
				echoMode: TextInput.Password
				placeholderText: "Password"
				onAccepted: {
					status.text = ""
					Greetd.createSession(username.text)
				}
			}

			Text {
				id: status
				anchors.horizontalCenter: parent.horizontalCenter
				color: "red"
				visible: text.length > 0
				text: ""
			}
		}
	}

	Connections {
		target: Greetd

		function onAuthMessage(message, error, responseRequired, echoResponse) {
			if(echoResponse) status.text = message
			if(responseRequired) Greetd.respond(password.text)
		}

		function onAuthFailure(message) {
			status.text = message
		}

		function onReadyToLaunch() {
			Greetd.launch(["niri-session"])
		}
	}
}
