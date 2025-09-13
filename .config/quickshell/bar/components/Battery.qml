import Quickshell.Services.UPower
import qs.services
import "widgets"

BarLabel {
	visible: UPower.displayDevice.isLaptopBattery
	reverse: true
	iconFont: ({ pixelSize: 20 })
	icon: {
		if(UPower.displayDevice.state === UPowerDeviceState.Charging || UPower.displayDevice.state === UPowerDeviceState.FullyCharged || UPower.displayDevice.state === UPowerDeviceState.PendingCharge) return LucideService.unicode("battery-charging")
		else if(UPower.displayDevice.percentage >= 0.75) return LucideService.unicode("battery-full")
		else if(UPower.displayDevice.percentage >= 0.5) return LucideService.unicode("battery-medium")
		else if(UPower.displayDevice.percentage >= 0.25) return LucideService.unicode("battery-low")
		else if(UPower.displayDevice.percentage >= 0) return LucideService.unicode("battery")
		else return LucideService.unicode("battery-warning")
	}
	text: `${(UPower.displayDevice.percentage * 100).toFixed(0)}%`
}
