if test -e /opt/homebrew/bin/brew
    eval "$(/opt/homebrew/bin/brew shellenv)"
end

if status is-interactive
    set fish_tmux_default_session_name home
    set fish_tmux_autostart true
end

# pure
set -g async_prompt_functions _pure_prompt_git

# hydro
set -g hydro_color_pwd f5c2e7
set -g hydro_color_git b4befe
set -g hydro_color_prompt a6e3a1
set -g hydro_multiline true
set -g hydro_symbol_git_dirty "*"
set -g hydro_symbol_prompt ❯
set -g hydro_cmd_duration_threshold 5000

#set LANG en_US.UTF-8
set -U fish_greeting

#function fish_greeting
#    fastfetch --config examples/13
#end

# Format man pages
set -x MANROFFOPT -c
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

fish_add_path ~/.local/bin ~/.local/scripts

# Fish command history
function history
    builtin history --show-time='%F %T '
end

function backup --argument filename
    cp $filename $filename.bak
end

## Useful aliases
# Replace ls with eza
alias ls='eza -al --color=always --group-directories-first --icons' # preferred listing
alias la='eza -a --color=always --group-directories-first --icons' # all files and dirs
alias ll='eza -l --color=always --group-directories-first --icons' # long format
alias lt='eza -aT --color=always --group-directories-first --icons' # tree listing
alias l.="eza -a | grep -e '^\.'" # show only dotfiles

# Common use
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# bind
bind \cs tmux-sessionizer

abbr -a gco git checkout
abbr -a gst git status

zoxide init fish | source
