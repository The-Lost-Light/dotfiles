import qs.services
import "widgets"

BarButton {
	id: root
	hoverEnabled: true
	text: TimeService.time

	BarToolTip {
		item: root
		text: TimeService.date
	}
}
