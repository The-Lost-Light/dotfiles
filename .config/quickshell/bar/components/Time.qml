import "root:services"
import "widgets"

BarMouseLabel {
	id: root
	hoverEnabled: true
	text: TimeService.time

	BarToolTip {
		item: root
		text: TimeService.date
	}
}
