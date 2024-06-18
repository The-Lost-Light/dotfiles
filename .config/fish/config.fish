if status is-login
    # Commands to run in login sessions can go here

    # Disable fish shell greeting
    set -U fish_greeting

    ## Set environment

    # Set wayland
    set -x ELECTRON_OZONE_PLATFORM_HINT auto

    # Set editor
    set -x VISUAL helix
    set -x EDITOR helix
    set -x DIFFPROG helix

    # Disable wine auto set default application
    set WINEDLLOVERRIDES winemenubuilder.exe=d

    # Set vaapi
    set -x LIBVA_DRIVER_NAME nvidia
    # set -x MOZ_DISABLE_RDD_SANDBOX 1
    # set -x MOZ_DRM_DEVICE /dev/dri/renderD128

    # Set cuda
    set -x NVD_GPU 0
    set -x XLA_FLAGS --xla_gpu_cuda_data_dir=/opt/cuda

    # Set fcitx5
    set -x XMODIFIERS @im=fcitx

    # Set sccache
    set -x RUSTC_WRAPPER sccache
end

if status is-interactive
    # Commands to run in interactive sessions can go here

    ## alias
    alias hx helix
    alias shx sudoedit
    alias ls lsd
    alias lst "ls --tree"
    # manage dotfiles
    alias config "git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

    ## plugin initial

    # initial starship
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

    # initial zoxide
    zoxide init --cmd cd fish | source

    # initial pyenv
    set -Ux PYENV_ROOT $HOME/.pyenv
    set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
    pyenv init - | source
    source (pyenv virtualenv-init - | psub)
end
