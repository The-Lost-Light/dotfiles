#!/usr/bin/env fish

set icons ~/.config/hypr/icons

function get_icons
	if test "$argv" -eq 0
		echo "$icons/brightness-0.png"
	else if test "$argv" -ge 0 -a "$argv" -le 51
        echo "$icons/brightness-20.png"
    else if test "$argv" -ge 51 -a "$argv" -le 102
        echo "$icons/brightness-40.png"
    else if test "$argv" -ge 102 -a "$argv" -le 153
        echo "$icons/brightness-60.png"
    else if test "$argv" -ge 153 -a "$argv" -le 204
        echo "$icons/brightness-80.png"
    else if test "$argv" -ge 204 -a "$argv" -le 255
        echo "$icons/brightness-100.png"
    end
end

function send_notify
	notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i (get_icons $argv) "Brightness: " (math "round($argv*20/51)")"%"
end

argparse i/increase-brightness d/decrease-brightness I/increase-keyboard-brightness D/decrease-keyboard-brightness  -- $argv
or return
if set -ql _flag_increase_brightness
    brightnessctl set -q 51+
	send_notify (brightnessctl get)
else if set -ql _flag_decrease_brightness
    brightnessctl set -q 51-
	send_notify (brightnessctl get)
else if set -ql _flag_increase_keyboard_brightness
	brightnessctl -d "*::kbd_backlight" set 1+
	send_notify (math "$(brightnessctl -d "*::kbd_backlight" get)*85")
else if set -ql _flag_decrease_keyboard_brightness
	brightnessctl -d "*::kbd_backlight" set 1-
	send_notify (math "$(brightnessctl -d "*::kbd_backlight" get)*85")
end

