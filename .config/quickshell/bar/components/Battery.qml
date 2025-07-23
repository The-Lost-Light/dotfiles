import Quickshell.Services.UPower
import "widgets"

BarLabel {
	text: `${(UPower.displayDevice.percentage * 100).toFixed(0)}%  `
}
