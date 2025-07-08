import QtQuick
import "components"

BarWidget {
	left: Row {
		spacing: 4

		Launcher {}
		Overview {}
	}

	center: Row {
		spacing: 4

		Arch {}
		Time {}
		PowerButton {}
	}

	right: Row {
		spacing: 4

		Monitor {}
		Battery {}
		Brightness {}
		Audio {}
		Tray {}
	}
}
