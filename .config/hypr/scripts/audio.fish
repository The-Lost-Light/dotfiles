#!/usr/bin/env fish

set icons ~/.config/hypr/assets/icons
set SINK @DEFAULT_AUDIO_SINK@
set SOURCE @DEFAULT_AUDIO_SOURCE@

function get_icons
    if string match -q Mute "$argv" or test "$argv" -eq 0
        echo "$icons/volume-mute.png"
    else if test "$argv" -ge 0 -a "$argv" -le 34
        echo "$icons/volume-low.png"
    else if test "$argv" -ge 34 -a "$argv" -le 67
        echo "$icons/volume-mid.png"
    else if test "$argv" -ge 67
        echo "$icons/volume-high.png"
    end
end

function get_volume
    set volume (wpctl get-volume $argv)
    set flag_mute (echo $volume | grep -oP "\[MUTED\]")
    if string match -q "$flag_mute" "[MUTED]"
        echo Mute
    else
        set volume (echo $volume | grep -oP "\d.\d+")
        echo (math "$volume*100")
    end
end

function send_notify
    set volume (get_volume $argv)
    if string match -q "$argv" "$SINK"
        set icon (get_icons $volume)
    else if string match -q "$argv" "$SOURCE"
        if string match -q "$volume" Mute
            set icon "$icons/microphone-mute.png"
        else
            set icon "$icons/microphone.png"
        end
    end

    set notify $volume
    if not string match -q "$volume" Mute
        set notify "Volume: " $notify"%"
    end
    notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i $icon $notify
end

function increase_volume
    if not string match -q "$(get_volume $argv)" Mute
        wpctl set-volume -l 1.0 $argv 5%+
        send_notify $argv
    end
end

function decrease_volume
    if not string match -q "$(get_volume $argv)" Mute
        wpctl set-volume -l 1.0 $argv 5%-
        send_notify $argv
    end
end

function toggle_volume
    wpctl set-mute $argv toggle
    send_notify $argv
end

argparse s/speaker t/toggle-volume m/microphone i/increase-volume d/decrease-volume -- $argv
or return

set STREAM $SINK
if set -ql _flag_speaker
    set STREAM $SINK
else if set -ql _flag_microphone
    set STREAM $SOURCE
end

if set -ql _flag_toggle_volume
    toggle_volume $STREAM
else if set -ql _flag_increase_volume
    increase_volume $STREAM
else if set -ql _flag_decrease_volume
    decrease_volume $STREAM
end
