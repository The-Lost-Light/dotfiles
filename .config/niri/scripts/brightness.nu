#!/usr/bin/env nu

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
	print $"($percent)%"
}

def main [--keyboard (-k)] { brightness get --keyboard=$keyboard }
def "main increase" [--keyboard (-k)] { brightness increase --keyboard=$keyboard }
def "main decrease" [--keyboard (-k)] { brightness decrease --keyboard=$keyboard }
