#!/usr/bin/env nu

let percentage = open "/sys/class/power_supply/BAT0/capacity" | into int
let icons = ["󰂃", "󰁺", "󰁻", "󰁼", "󰁽", "󰁾", "󰁿", "󰂀", "󰂁", "󰁹"]

let status = open "/sys/class/power_supply/BAT0/status"
let icon = if $status == "Charging" {
	"󰂄"
} else {
    let index = [($percentage / 10), ($icons | length | $in - 1)] | math min
    ($icons | get $index)
}

print $"($percentage)% ($icon)"
