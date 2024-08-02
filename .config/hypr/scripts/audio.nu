#!/usr/bin/env nu

def notify [device: string, volume: int, --muted] {
	let threshold = [0, 1, 34, 67] | where { |threshold| $volume >= $threshold } | last

	let icon = match $device {
		speaker => (if $muted or $threshold == 0 {
			"mute"
		} else match $threshold {
			1 => "low"
			34 => "mid"
			67 => "high"
		} | $"~/.config/hypr/assets/icons/volume-($in).png")
		microphone => (if $muted or $threshold == 0 {
			"-mute"
		} | $"~/.config/hypr/assets/icons/microphone($in).png")
	}

	let message = [(if $muted { "Mute" } else { "Volume:" }), (if not $muted { $"($volume)%" } )] | compact
	notify-send -h string:x-canonical-private-synchronous:sys-notify --urgency low --icon ($icon | path expand) ...$message
}

def volume [device: string, tweak: string] {
	let target = match $device {
		speaker => "@DEFAULT_AUDIO_SINK@"
		microphone => "@DEFAULT_AUDIO_SOURCE@"
	}

	let status = wpctl get-volume $target | split row ' '
	let muted = ($status | any  {|s| $s == "[MUTED]"})

	match $tweak {
		increase => { if not $muted { wpctl set-volume -l 1.0 $target 5%+ } }
		decrease => { if not $muted { wpctl set-volume -l 1.0 $target 5%- } }
		toggle => { wpctl set-mute $target toggle }
		_ => (exit 1)
	}

	let status = wpctl get-volume $target | split row ' '
	let muted = ($status | any  {|s| $s == "[MUTED]"})
	notify $device (($status.1 | into float) * 100 | math floor) --muted=$muted
}

def main [] {}
def "main speaker" [tweak: string] { volume "speaker" $tweak }
def "main microphone" [tweak: string] {	volume "microphone" $tweak }
