#!/usr/bin/fish

set icons ~/.config/hypr/icons

function get_icons
	if string match -q "Mute" "$argv" or test "$argv" -eq 0
        echo "$icons/volume-mute.png"
    else if test "$argv" -ge 0 -a "$argv" -le 30
        echo "$icons/volume-low.png"
    else if test "$argv" -ge 30 -a "$argv" -le 60
        echo "$icons/volume-mid.png"
    else if test "$argv" -ge 60 -a "$argv" -le 100
        echo "$icons/volume-high.png"
    end
end

function get_volume
	set flag_mute (amixer get $argv | grep -oP "\[off\]")
	if string match -q "[off] [off]" "$flag_mute"
		echo "Mute"
	else
		set volume (amixer get $argv | grep -oP "\d+%")
		set left_volume (echo "$volume" | head -n1 | cut -d'%' -f1)
		set right_volume (echo "$volume" | tail -n1 | cut -d'%' -f1)
		set average_volume (math "($left_volume + $right_volume) / 2")
		echo $average_volume
	end
end

function send_notify
	if string match -q "Master" "$argv[1]"
		set icon (get_icons $argv[2])
	else if string match -q "Capture" "$argv[1]"
		if string match -q "Mute" "$argv[2]"
			set icon "$icons/microphone-mute.png"
		else
			set icon "$icons/microphone.png"
		end
	end
	
	if string match -q "Mute" "$argv[2]"
		set notify $argv[2]
	else
		set notify "Volume: " $argv[2]"%"
	end
	notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i $icon $notify 
end

function increase_volume
    amixer --quiet set $argv 5%+
	send_notify $argv (get_volume $argv)
end

function decrease_volume
    amixer --quiet set $argv 5%-
	send_notify $argv (get_volume $argv)
end

function toggle_volume
	amixer --quiet set $argv toggle
	send_notify $argv (get_volume $argv)
end

argparse t/toggle-volume i/increase-volume d/decrease-volume T/toggle-microphone I/increase-microphone D/decrease-microphone  -- $argv
or return
if set -ql _flag_toggle_volume
	toggle_volume Master
else if set -ql _flag_increase_volume
	increase_volume Master
else if set -ql _flag_decrease_volume
	decrease_volume Master
else if set -ql _flag_toggle_microphone
	toggle_volume Capture
else if set -ql _flag_increase_microphone
	increase_volume Capture
else if set -ql _flag_decrease_microphone
	decrease_volume Capture
end
