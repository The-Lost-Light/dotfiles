import Quickshell.Services.UPower
import "widgets"

BarLabel {
	visible: UPower.displayDevice.isLaptopBattery
	reverse: true
	iconFont: "lucide"
	iconSize: 20
	icon: {
		if(UPower.displayDevice.state === UPowerDeviceState.Charging || UPower.displayDevice.state === UPowerDeviceState.FullyCharged || UPower.displayDevice.state === UPowerDeviceState.PendingCharge) return ''
		else if(UPower.displayDevice.percentage > 0.8) return ''
		else if(UPower.displayDevice.percentage > 0.6) return ''
		else if(UPower.displayDevice.percentage > 0.4) return ''
		else if(UPower.displayDevice.percentage > 0.2) return ''
		else return ''
	}
	text: `${(UPower.displayDevice.percentage * 100).toFixed(0)}%`
}
