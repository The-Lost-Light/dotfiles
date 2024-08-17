if status is-login
    # SSH
    set -x SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket

    # wayland
    set -x ELECTRON_OZONE_PLATFORM_HINT auto

    # VA-API
    set -x LIBVA_DRIVER_NAME radeonsi

    # Vulkan
    set -x MESA_VK_DEVICE_SELECT 0x1002:0x1636

    # CUDA
    set -x NVD_GPU 0
    set -x XLA_FLAGS --xla_gpu_cuda_data_dir=/opt/cuda

    # Fcitx5
    set -x XMODIFIERS @im=fcitx

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
    function starship_transient_rprompt_func
        starship module cmd_duration
    end
    if string match -q "$TERM" xterm-kitty
        starship init fish | source
        enable_transience
    end

    # Initial Zoxide
    zoxide init --cmd cd fish | source

    # Initial Pyenv
    set -Ux PYENV_ROOT $HOME/.pyenv
    fish_add_path $PYENV_ROOT/bin
    pyenv init - | source
    pyenv virtualenv-init - | source
end
