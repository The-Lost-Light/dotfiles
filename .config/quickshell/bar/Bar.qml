import QtQuick
import "components"

BarWidget {
	left: Row {
		spacing: 8

		Launcher {}
		Overview {}
	}

	center: Row {
		spacing: 8

		Arch {}
		Time {}
		PowerButton {}
	}

	right: Row {
		spacing: 8

		Monitor {}
		Battery {}
		Brightness {}
		Audio {}
		Tray {}
	}
}
