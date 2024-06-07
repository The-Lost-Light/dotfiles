#!/usr/bin/env fish

argparse u/update -- $argv
or return
if set -ql _flag_update
    kitty fish -c "paru; read -p \"echo Done - Press enter to exit\""
end

set OFFICIAL (checkupdates | wc -l)
set AUR (paru -Qua | wc -l)
set COUNT (math "$OFFICIAL + $AUR")
if test $COUNT -ne 0
    echo -n $COUNT
end
echo ""
