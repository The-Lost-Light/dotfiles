import QtQuick

Menu {
	required property QtObject menu
	menu_: menu

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
