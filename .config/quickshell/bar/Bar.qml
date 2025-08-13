import QtQuick
import qs.config
import "components"

BarWidget {
	left: Row {
		spacing: Config.bar.spacing

		Launcher {}
		Overview {}
	}

	center: Row {
		spacing: Config.bar.spacing

		Arch {}
		Time {}
		PowerButton {}
	}

	right: Row {
		spacing: Config.bar.spacing

		Battery {}
		Brightness {}
		Audio {}
		Tray {}
		Notification {}
	}
}
