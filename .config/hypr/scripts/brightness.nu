#!/usr/bin/env nu

def icon [value: int] {
	let percent = [0, 51, 102, 153, 204, 255] | where {|threshold| $threshold >= $value} | first | $in * 20 / 51
	return $"~/.config/hypr/assets/icons/brightness-($percent).png"
}

def notify [value: int] {
	notify-send --urgency low --icon (icon $value | path expand) --hint string:x-canonical-private-synchronous:sys-notify  "Brightness: " $"($value * 20 / 51 | math round)%"
}

def main [tweak?: string, --keyboard (-k)] {
	let flags = if $keyboard { [--device *::kbd_backlight] } | default []

	let operator =  (if $keyboard { "1" } else { "51" }) + (match $tweak {
		increase => '+'
		decrease => '-'
		_ => (brightnessctl get ...$flags; exit)
	})
	brightnessctl set $operator -q ...$flags

	let value = brightnessctl get ...$flags | into int
	notify (if $keyboard { $value * 85 } else { $value })
}
