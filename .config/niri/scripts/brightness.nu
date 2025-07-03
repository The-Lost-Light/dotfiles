#!/usr/bin/env nu

def notify [value: int] {
	let percent = [0, 51, 102, 153, 204, 255] | where { |threshold| $value >= $threshold } | last | $in * 20 / 51
	let icon = $"~/.config/niri/assets/icons/brightness-($percent).png"
	notify-send --urgency low --icon ($icon | path expand) --hint string:x-canonical-private-synchronous:sys-notify  "Brightness: " $"($value * 20 / 51 | math round)%"
}

def brightness [tweak?: string, --keyboard (-k)] {
	let flags = if $keyboard { [--device *::kbd_backlight] } | default []

	let operator =  (if $keyboard { "1" } else { "51" }) + (match $tweak {
		get => (brightnessctl get ...$flags; exit)
		increase => '+'
		decrease => '-'
	})
	brightnessctl set $operator -q ...$flags

	let value = brightnessctl get ...$flags | into int
	notify (if $keyboard { $value * 85 } else { $value })
	echo $value
}

def main [--keyboard (-k)] { brightness get --keyboard=$keyboard }
def "main increase" [--keyboard (-k)] { brightness increase --keyboard=$keyboard }
def "main decrease" [--keyboard (-k)] { brightness decrease --keyboard=$keyboard }
