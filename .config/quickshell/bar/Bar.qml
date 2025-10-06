import QtQuick
import qs.configs
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
	}
}
