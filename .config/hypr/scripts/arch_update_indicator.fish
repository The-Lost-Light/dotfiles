#!/usr/bin/fish

set AUR (yay -Qua | wc -l)
set OFFICIAL (checkupdates | wc -l)

argparse u/update  -- $argv
or return
if set -ql _flag_update
    wezterm start yay
else
    set COUNT (math "$OFFICIAL + $AUR")
    if test "$COUNT" -ne 0
        echo -n " $COUNT"
    end
    echo ""
end
