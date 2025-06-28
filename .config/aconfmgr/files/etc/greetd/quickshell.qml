import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Services.Greetd

ShellRoot {
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

		Column {
			anchors.centerIn: parent

			TextField {
				id: username
				focus: true
				placeholderText: "Username"
				onAccepted: password.focus = true
			}

			TextField {
				id: password
				echoMode: TextInput.Password
				placeholderText: "Password"
				onAccepted: {
					Greetd.createSession(username.text)
				}
			}
		}
	}

	Connections {
        target: Greetd

        function onAuthMessage(message, error, responseRequired, echoResponse) {
            if (responseRequired) {
            	Greetd.respond(password.text)
            }
        }

        function onReadyToLaunch() {
            Greetd.launch(["niri-session"])
        }
    }
}
