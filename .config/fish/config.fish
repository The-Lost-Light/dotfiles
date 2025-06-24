if status is-login
	# Desktop
	set -x LANG zh_TW.UTF-8
	set -x DISPLAY :0 # xwayland-satellite
	set -x ELECTRON_OZONE_PLATFORM_HINT auto
	set -x STEAM_FORCE_DESKTOPUI_SCALING 1.25
	set -x ZED_WINDOW_DECORATIONS server
	set -x QT_QPA_PLATFORMTHEME qt6ct
	# SSH
	set -x SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket

	# Hardware Video Acceleration
	set -x LIBVA_DRIVER_NAME radeonsi
	set -x VDPAU_DRIVER radeonsi

	# Vulkan
	set -x MESA_VK_DEVICE_SELECT 0x1002:0x1636

	# CUDA
	set -x NVD_GPU 0
	set -x XLA_FLAGS --xla_gpu_cuda_data_dir=/opt/cuda

	# Fcitx5
	set -x XMODIFIERS @im=fcitx
	set -x QT_IM_MODULES "wayland;fcitx;ibus"
	set -x QT_IM_MODULE fcitx

	# Sccache
	set -x RUSTC_WRAPPER sccache

	# Editor
	set -x VISUAL helix
	set -x EDITOR helix
	set -x DIFFPROG helix
end

if status is-interactive
	# alias
	alias hx helix
	alias ls lsd
	alias lst "ls --tree"
	# manage dotfiles
	alias config "git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

	# Initial Starship
	function starship_transient_prompt_func
	starship module character
	end
	if string match -q "$TERM" xterm-kitty
	starship init fish | source
	enable_transience
	end

	# Initial Zoxide
	zoxide init --cmd cd fish | source

	# Initial Jujutsu
	jj util completion fish | source

	# Initial UV
	uv generate-shell-completion fish | source
	uvx --generate-shell-completion fish | source
end
