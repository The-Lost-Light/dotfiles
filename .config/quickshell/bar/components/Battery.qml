import Quickshell.Services.UPower
import qs.widgets

StyledLabel {
	text: `${(UPower.displayDevice.percentage * 100).toFixed(0)}%  `
}
