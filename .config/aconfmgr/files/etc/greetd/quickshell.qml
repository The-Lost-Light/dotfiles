pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Services.Greetd

ShellRoot {
	id: root
	property string username
	property string password
	property string status

	Variants {
		model: Quickshell.screens

		PanelWindow {
			required property ShellScreen modelData
			anchors {
				right: true
				bottom: true
				top: true
				left: true
			}
			color: "transparent"
			exclusionMode: ExclusionMode.Ignore
			focusable: true
			screen: modelData

			Image {
				anchors.fill: parent
				source: "/etc/greetd/login.png"
				fillMode: Image.PreserveAspectCrop
				z: -1
			}

			Column {
				anchors.centerIn: parent

				TextField {
					anchors.horizontalCenter: parent.horizontalCenter
					focus: true
					placeholderText: "Username"
					text: root.username
					onTextChanged: root.username = text
					onAccepted: {
						if (text.length > 0) password.focus = true;
					}
				}

				TextField {
					id: password
					anchors.horizontalCenter: parent.horizontalCenter
					echoMode: TextInput.Password
					placeholderText: "Password"
					text: root.password
					onTextChanged: root.password = text
					onAccepted: {
						root.status = "";
						Greetd.createSession(root.username);
					}
				}

				Text {
					anchors.horizontalCenter: parent.horizontalCenter
					color: "red"
					visible: text.length > 0
					text: root.status
				}
			}
		}
	}

	Connections {
		target: Greetd

		function onAuthMessage(message, error, responseRequired, echoResponse) {
			if (echoResponse)
				root.status = message;
			if (responseRequired)
				Greetd.respond(root.password);
		}

		function onAuthFailure(message) {
			root.status = message;
		}

		function onReadyToLaunch() {
			Greetd.launch(["niri-session", ">", "/dev/null", "2>&1"]);
		}
	}
}
