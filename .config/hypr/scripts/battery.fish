#!/bin/env fish

set percentage (cat /sys/class/power_supply/BAT0/capacity)
set icons "󰂃" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰁹"

if string match -q (cat /sys/class/power_supply/BAT0/status) Charging
    set icon "󰂄"
else
    set index (math "$percentage / 10")
    set icon $icons[$index]
end

echo "$percentage% $icon"
