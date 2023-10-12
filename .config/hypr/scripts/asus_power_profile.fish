#!/usr/bin/env fish

argparse n/next -- $argv
or return

if set -ql _flag_next
    asusctl profile -n
    pkill -SIGRTMIN+1 waybar
end

set profile $(asusctl profile -p | sed s:"Active profile is "::)

if set -ql _flag_next
    notify-send -h string:x-canonical-private-synchronous:sys-notify -u low $profile
end

if string match -q $profile "Balanced"
    set icon "󰾅"
else if string match -q $profile "Performance"
    set icon "󰓅"
else if string match -q $profile "Quiet"
    set icon "󰾆"
end
echo "{\"text\": \"$icon\", \"tooltip\": \"$profile\"}"
