#!/usr/bin/fish
if not hyprctl --batch workspaces | grep special:terminal
	hyprctl --batch dispatch exec [workspace special:terminal] wezterm
	sleep 0.5
end
hyprctl --batch dispatch togglespecialworkspace terminal
