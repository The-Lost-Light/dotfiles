if status is-interactive
    # Theme
    fish_config theme choose catppuccin-macchiato --color-theme=dark

    # Alias
    alias hx helix
    alias ls lsd
    alias lst "ls --tree"
    alias config "git --git-dir=$HOME/dotfiles.git --work-tree=$HOME"

    # Plugins
    function starship_transient_prompt_func
        starship module character
    end
    starship init fish | source
    enable_transience

    jj util completion fish | source
    niri completions fish | source
    uv generate-shell-completion fish | source
    uvx --generate-shell-completion fish | source
    zoxide init --cmd cd fish | source
end
