#!/usr/bin/env nu

let folder = "/tmp/hyprlock"
let url = playerctl metadata mpris:artUrl

if $url == "" {
    print ""
} else {
    if $url starts-with "file://" {
        print ($url | str replace "file://" "")
    } else {
        if not ($folder | path exists) {
            mkdir $folder
        }

        let path = $folder | path join ($url | path basename)
        if not ($path | path exists) {
            http get $url | save $path
        	magick $path $"($path).png"
        }

        print $"($path).png"
    }
}
