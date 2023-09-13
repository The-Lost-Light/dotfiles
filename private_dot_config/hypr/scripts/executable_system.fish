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
    notify-send -u low -i (get_icon) "Volume: (get_volume) %"
end

function increase_volume
    amixer sset Master 5%+
    send_notify
end

function decrease_volume
    amixer sset Master 5%-
    send_notify
end


if test "$1" = "--abc"
	echo "123"
else if test "$1" = "--get"
    get_volume
else if test "$1" = "--inc"
    increase_volume
else if test "$1" = "--dec"
    decrease_volume
end
