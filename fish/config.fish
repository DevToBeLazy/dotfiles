if status is-interactive
    # Commands to run in interactive sessions can go here

    and not set -q TMUX
    exec tmux
end


set fish_greeting
set -gx EDITOR nvim
set force_color_prompt yes
set -Ux EZA_STANDARD_OPTIONS --icons --hyperlink

# Fzf
set -g FZF_PREVIEW_FILE_CMD "bat --style=numbers --color=always --line-range :500"
set -g FZF_LEGACY_KEYBINDINGS 0

fish_ssh_agent

starship init fish | source
zoxide init fish | source
