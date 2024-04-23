function fish_prompt -d "Write out the prompt"
    # This shows up as USER@HOST /home/user/ >, with the directory colored
    # $USER and $hostname are set by fish, so you can just use them
    # instead of using `whoami` and `hostname`
    printf '%s@%s %s%s%s > ' $USER $hostname \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting

end


set -gx EDITOR nvim
set force_color_prompt yes
set -Ux EZA_STANDARD_OPTIONS --icons --hyperlink

# Fzf
set -g FZF_PREVIEW_FILE_CMD "bat --style=numbers --color=always --line-range :500"
set -g FZF_LEGACY_KEYBINDINGS 0

fish_ssh_agent

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

#cargo
set --export CARGO_INSTALL "$HOME/.cargo"
set --export PATH $CARGO_INSTALL/bin $PATH


starship init fish | source
zoxide init fish | source

if test -f ~/.cache/ags/user/generated/terminal/sequences.txt
    cat ~/.cache/ags/user/generated/terminal/sequences.txt
end

alias pamcan=pacman

# function fish_prompt
#   set_color cyan; echo (pwd)
#   set_color green; echo '> '
# end
if status is-interactive
    # Commands to run in interactive sessions can go here

    and not set -q TMUX
    exec tmux
end
