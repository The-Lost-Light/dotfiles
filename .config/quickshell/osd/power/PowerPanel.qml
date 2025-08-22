import QtQuick
import qs.configs

PowerMenu {
	PowerButton {
		text: ''
		command: "notify-send undefined"
	}

	PowerButton {
		text: ''
		command: "niri msg action quit"
	}

	PowerButton {
		color: Color.red
		text: ''
		command: "systemctl poweroff"
	}

	PowerButton {
		text: ''
		command: "systemctl reboot"
	}

	PowerButton {
		text: ''
		command: "systemctl suspend"
	}
}
