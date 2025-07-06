import QtQuick

Menu {
	PowerButton {
		command: "notify-send undefined"
		text: ""
	}

	PowerButton {
		command: "niri msg action quit"
		text: ""
	}

	PowerButton {
		command: "systemctl poweroff"
		text: "⏻"
	}

	PowerButton {
		command: "systemctl reboot"
		text: ""
	}

	PowerButton {
		command: "systemctl suspend"
		text: "󰤄"
	}
}
