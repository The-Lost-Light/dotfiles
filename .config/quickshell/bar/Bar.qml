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

		Time {}
		PowerButton {}
	}
	right: Row {
		spacing: 4

		Battery {}
		Brightness {}
		Audio {}
		Tray {}
	}
}
