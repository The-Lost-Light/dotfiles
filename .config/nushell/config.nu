# History-related Settings
$env.config.history.file_format = "sqlite"
$env.config.history.isolation = true

# Miscellaneous Settings
$env.config.show_banner = false
$env.config.rm.always_trash = true
$env.config.buffer_editor = "helix"

# Completions Behavior
$env.config.completions.algorithm = "substring"
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
$env.config.display_errors.termination_signal = false

# Table Display
$env.config.footer_mode = "auto"
$env.config.table.index_mode = "auto"
$env.config.table.header_on_separator = true
$env.config.table.footer_inheritance = true

# Keybinds
$env.config.keybindings ++= [
    {
        name: toggle_sudo
        modifier: alt
        keycode: char_s
        mode: [emacs vi_insert vi_normal]
        event: {
            send: executehostcommand
            cmd: "let cmd = (commandline); commandline edit (if $cmd starts-with sudo { $cmd | str replace -r '^sudo ' '' } else { 'sudo ' ++ $cmd });"
        }
    }
]

# Themes/Colors and Syntax Highlighting
$env.config.highlight_resolved_externals = true

# Alias
alias hx = helix
alias flutter = fvm flutter
alias l = ls
alias ls = lsd
alias la = lsd --all
alias ll = lsd --long --all
alias lt = lsd --tree
alias dotfiles = git --git-dir=($env.HOME)/.dotfiles --work-tree=($env.HOME)

# Startup
kotofetch
