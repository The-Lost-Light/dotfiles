#!/usr/bin/env nu

def notify [value: int] {
	let percent = [0, 20, 40, 60, 80, 100] | where { |threshold| $value >= $threshold } | last
	let icon = $"~/.config/niri/assets/icons/brightness-($percent).png"
	notify-send --urgency low --icon ($icon | path expand) --hint string:x-canonical-private-synchronous:sys-notify  "Brightness: " $"($value)%"
}

def calculate_percent [flags: list] {
	let value = brightnessctl get ...$flags | into int
	let max_value = brightnessctl max ...$flags | into int
	return ($value * 100 / $max_value | math round)
}

def brightness [tweak?: string, --keyboard (-k)] {
	let flags = if $keyboard { [--device *::kbd_backlight] } | default []

	let operator = (if $keyboard { "1" } else { "20%" }) + (match $tweak {
		get => (calculate_percent ($flags) | $"($in)%" | print; exit)
		increase => '+'
		decrease => '-'
	})
	brightnessctl set $operator -q ...$flags
	let percent = calculate_percent ($flags)
	notify ($percent)
	print $"($percent)%"
}

def main [--keyboard (-k)] { brightness get --keyboard=$keyboard }
def "main increase" [--keyboard (-k)] { brightness increase --keyboard=$keyboard }
def "main decrease" [--keyboard (-k)] { brightness decrease --keyboard=$keyboard }
