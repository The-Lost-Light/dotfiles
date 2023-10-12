#!/usr/bin/env fish

argparse u/update  -- $argv
or return
if set -ql _flag_update
    wezterm start fish -c "yay; read -p \"echo Done - Press enter to exit\""
end

set OFFICIAL (checkupdates | wc -l)
set AUR (yay -Qua | wc -l)
if test (math "$OFFICIAL + $AUR") -ne 0
    echo -n " $COUNT"
end
echo ""