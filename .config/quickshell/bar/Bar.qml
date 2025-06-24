import QtQuick
import "components"

BarWidget {
	center: Row {
		spacing: 2

		Time {}
		PowerButton {}
	}

	left: Row {
		spacing: 2

		Launcher {}
		Overview {}
	}

	right: Row {
		spacing: 2

		Battery {}
		Tray {}
	}
}
