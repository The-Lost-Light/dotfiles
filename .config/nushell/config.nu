$env.config.show_banner = false
$env.config.buffer_editor = "helix"
$env.config.completions = {
	algorithm: "fuzzy"
}
$env.config.completions.external = {
	max_results: 50
	completer: { |spans: list<string>|
		let expanded_alias = (scope aliases | where name == $spans.0 | get --optional 0 | get --optional expansion)
		let spans = (if $expanded_alias != null  {
			 $spans | skip 1 | prepend ($expanded_alias | split row " " | take 1)
		} else { $spans })

		carapace $spans.0 nushell ...$spans
		| from json
		| if ($in | default [] | where value == $"($spans | last)ERR" | is-empty) { $in } else { null }
	}
}

alias hx = helix
alias l = lsd
alias la = lsd --all
alias ll = lsd --long --all
alias lt = lsd --tree
alias dotfiles = git --git-dir=($env.HOME)/.dotfiles --work-tree=($env.HOME)

let autoload = $nu.data-dir | path join "vendor/autoload"
mkdir $autoload

starship init nu | save --force ($autoload | path join "starship.nu")

zoxide init nushell | save --force ($autoload | path join "zoxide.nu")

jj util completion nushell | save --force ($autoload | path join "jj.nu")

uv generate-shell-completion nushell | save --force ($autoload | path join "uv.nu")
uvx --generate-shell-completion nushell | save --force ($autoload | path join "uvx.nu")
