#!/usr/bin/env fish

set path /tmp/hyprlock_music
set url (playerctl metadata mpris:artUrl)

if test -z $url
    echo ""
else if string match -q --regex "^file://" $url
    echo (string replace --regex "^file://" '' $url )
else
    curl -s (playerctl metadata mpris:artUrl) -o $path
    magick $path "$path".png
    echo "$path".png
end
