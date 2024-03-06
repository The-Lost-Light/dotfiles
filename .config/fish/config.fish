if status is-login
	# Commands to run in login sessions can go here

	# disable fish shell greeting
	set -U fish_greeting
	## set environment
	# set wayland
	# set -x SDL_VIDEODRIVER wayland
	# set editor
	set -x VISUAL helix
	set -x EDITOR helix
	set -x DIFFPROG helix
	# disable wine auto set default application 
	set WINEDLLOVERRIDES winemenubuilder.exe=d
	# set cuda for tensorflow
	set -x XLA_FLAGS --xla_gpu_cuda_data_dir=/opt/cuda
	# set language
	set -x LANG zh_TW.UTF-8
	# set fcitx5
	set -x GTK_IM_MODULE fcitx
	set -x QT_IM_MODULE fcitx
	set -x XMODIFIERS @im=fcitx
	set -x SDL_IM_MODULE fcitx
end

if status is-interactive
	# Commands to run in interactive sessions can go here
	## alias
	alias hx "helix"
	alias shx "sudoedit"
	alias fm "yazi"
	alias ls "lsd"
	alias lst "ls --tree"
	# manage dotfiles
	alias config "/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

	## plugin initial
	# initial starship
	function starship_transient_prompt_func
		starship module character
	end
	function starship_transient_rprompt_func
		starship module cmd_duration
	end
	starship init fish | source
	enable_transience

	# initial zoxide
	zoxide init --cmd cd fish | source

	# initial pyenv
	set -Ux PYENV_ROOT $HOME/.pyenv
	set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
	pyenv init - | source
	source (pyenv virtualenv-init - | psub)
end
