import qs.services
import qs.configs

PowerMenu {
	PowerButton {
		text: LucideService.unicode("lock")
		command: "notify-send undefined"
	}

	PowerButton {
		text: LucideService.unicode("log-out")
		command: "niri msg action quit"
	}

	PowerButton {
		color: Color.red
		text: LucideService.unicode("power")
		command: "systemctl poweroff"
	}

	PowerButton {
		text: LucideService.unicode("refresh-ccw")
		command: "systemctl reboot"
	}

	PowerButton {
		text: LucideService.unicode("moon")
		command: "systemctl suspend"
	}
}
