#!/usr/bin/fish

set ICON ~/.config/hypr/icons

function get_icon
    set current (get_volume)
    if test "$current" -eq 0
        echo "$ICON/volume-mute.png"
    else if test "$current" -ge 0 -a "$current" -le 30
        echo "$ICON/volume-low.png"
    else if test "$current" -ge 30 -a "$current" -le 60
        echo "$ICON/volume-mid.png"
    else if test "$current" -ge 60 -a "$current" -le 100
        echo "$ICON/volume-high.png"
    end
end

function get_volume
    set volume (amixer get Master | grep -oP '(\d+%)')
    set left_volume (echo "$volume" | head -n1 | cut -d'%' -f1)
    set right_volume (echo "$volume" | tail -n1 | cut -d'%' -f1)
    set average_volume (math "($left_volume + $right_volume) / 2")
    echo $average_volume
end

function send_notify
    notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i (get_icon) "Volume: $(get_volume)%"
end

function increase_volume
    amixer sset Master 5%+
    send_notify
end

function decrease_volume
    amixer sset Master 5%-
    send_notify
end


argparse g/get-volume i/increase-volume d/decrease-volume -- $argv
or return
if set -ql _flag_get_volume
	get_volume
else if set -ql _flag_increase_volume
	increase_volume
else if set -ql _flag_decrease_volume
	decrease_volume
end
