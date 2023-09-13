if status is-login
	# Commands to run in login sessions can go here

	## set environment
	set -x VISUAL nvim
	set -x EDITOR nvim
	set -x TERM wezterm
	# set -x ALSOFT_DRIVERS pulse
	# disable wine auto set default application 
	set WINEDLLOVERRIDES winemenubuilder.exe=d
	set -x XDG_CONFIG_HOME ~/.config
	set -x CONFIG ~/.config
	set -U fish_greeting
	## set language
	set -x LANG zh_TW.UTF-8
	## set fcitx5
	set -x GTK_IM_MODULE fcitx
	set -x QT_IM_MODULE fcitx
	set -x XMODIFIERS @im=fcitx
	set -x SDL_IM_MODULE fcitx
	set -x GLFW_IM_MODULE ibus

	## alias
	alias snvim "sudoedit"
	alias fm "joshuto"
	alias ls "lsd"
	alias lst "ls --tree"

	## initial starship
	function starship_transient_prompt_func
		starship module character
	end
	function starship_transient_rprompt_func
		starship module cmd_duration
	end
	starship init fish | source
	enable_transience

	## initial zoxide
	zoxide init --cmd cd fish | source
end
if status is-interactive
	# Commands to run in interactive sessions can go here

end
