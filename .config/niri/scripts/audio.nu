#!/usr/bin/env nu

def volume [device: string, tweak?: string] {
	let target = match $device {
		speaker => "@DEFAULT_AUDIO_SINK@"
		microphone => "@DEFAULT_AUDIO_SOURCE@"
	}

	let status = wpctl get-volume $target | split row ' '
	let muted = $status | any  {|s| $s == "[MUTED]"}

	match $tweak {
		null => (print $status.1; exit)
		increase => { if not $muted { wpctl set-volume --limit 1 $target 5%+ } }
		decrease => { if not $muted { wpctl set-volume $target 5%- } }
		toggle => { wpctl set-mute $target toggle }
		_ => (exit 1)
	}

	let status = wpctl get-volume $target | split row ' '
	let muted = $status | any  {|s| $s == "[MUTED]"}
}

def main [] {}
def "main speaker" [tweak?: string] { volume "speaker" $tweak }
def "main microphone" [tweak?: string] {	volume "microphone" $tweak }
