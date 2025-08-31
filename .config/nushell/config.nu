# History-related Settings
$env.config.history.file_format = "sqlite"

# Miscellaneous Settings
$env.config.show_banner = false
$env.config.rm.always_trash = true
$env.config.buffer_editor = "helix"

# Completions Behavior
$env.config.completions.algorithm = "fuzzy"
$env.config.completions.external = {
	completer: { |spans: list<string>|
		let expanded_alias = scope aliases | where name == $spans.0 | get --optional 0 | get --optional expansion
		let spans = if $expanded_alias != null {
			 $spans | skip 1 | prepend ($expanded_alias | split row " " | take 1)
		} else { $spans }

		carapace $spans.0 nushell ...$spans | from json | if ($in | default [] | where value == $"($spans | last)ERR" | is-empty) { $in } else { null }
	}
}

# Terminal Integration
$env.config.use_kitty_protocol = true

# Error Display Settings
$env.config.display_errors.exit_code = true

# Table Display
$env.config.footer_mode = "auto"

# Themes/Colors and Syntax Highlighting
$env.config.highlight_resolved_externals = true

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
