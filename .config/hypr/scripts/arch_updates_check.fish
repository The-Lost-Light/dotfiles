#!/usr/bin/env fish

argparse u/update -- $argv
or return
if set -ql _flag_update
    kitty fish -c "paru; read -P '$(printf "\033[34m\n:: Update Completed!\n\033[33m:: Press any key to exit!\033[0m")'"
    exit
end

set OFFICIAL (checkupdates | string split \n)
set AUR (paru -Qua | string split \n)
set COUNT (math (count $OFFICIAL) + (count $AUR))

echo $COUNT

if test $COUNT -ne 0
    for update in $OFFICIAL $AUR
        set package (echo $update | string split ' ')

        for i in (seq (string length $package[2]))
            if string match -qv (string sub -l $i $package[2]) (string sub -l $i $package[4])
                set package $package[1] (string sub -l (math $i - 1) $package[2]) (string sub -s $i $package[4])
                break
            end
        end

        echo $package
    end
end
