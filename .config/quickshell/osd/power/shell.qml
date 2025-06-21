import Quickshell

ShellRoot {
	Menu {
		Button {
			text: ""
			command: "notify-send undefined"
		}
		Button {
			text: ""
			command: "niri msg action quit"
		}
		Button {
			text: "⏻"
			command: "systemctl poweroff"
		}
		Button {
			text: ""
			command: "systemctl reboot"
		}
		Button {
			text: "󰤄"
			command: "systemctl suspend"
		}
	}
}
