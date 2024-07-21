#!/usr/bin/env fish

set folder /tmp/hyprlock
set url (playerctl metadata mpris:artUrl)

if test -z $url
    echo ""
else if string match -q --regex "^file://" $url
    echo (string replace --regex "^file://" '' $url)
else
    if not test -e $folder
        mkdir $folder
    end
    set path $folder/(basename $url)
    if not test -e $path
        curl -s $url -o "$path"
        magick $path "$path".png
    end
    echo "$path".png
end
