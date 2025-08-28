import Quickshell.Services.UPower
import "widgets"

BarLabel {
	visible: UPower.displayDevice.isLaptopBattery
	reverse: true
	iconFont: ({ pixelSize: 20 })
	icon: {
		if(UPower.displayDevice.state === UPowerDeviceState.Charging || UPower.displayDevice.state === UPowerDeviceState.FullyCharged || UPower.displayDevice.state === UPowerDeviceState.PendingCharge) return ''
		else if(UPower.displayDevice.percentage >= 0.75) return ''
		else if(UPower.displayDevice.percentage >= 0.5) return ''
		else if(UPower.displayDevice.percentage >= 0.25) return ''
		else if(UPower.displayDevice.percentage >= 0) return ''
		else return ''
	}
	text: `${(UPower.displayDevice.percentage * 100).toFixed(0)}%`
}
