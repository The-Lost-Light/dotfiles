let autoload = $nu.data-dir | path join "vendor/autoload"
mkdir $autoload

jj util completion nushell | save --force ($autoload | path join "jj.nu")

niri completions nushell | save --force ($autoload | path join "niri.nu")

starship init nu | save --force ($autoload | path join "starship.nu")

uv generate-shell-completion nushell | save --force ($autoload | path join "uv.nu")
uvx --generate-shell-completion nushell | save --force ($autoload | path join "uvx.nu")

zoxide init nushell --cmd cd | save --force ($autoload | path join "zoxide.nu")
