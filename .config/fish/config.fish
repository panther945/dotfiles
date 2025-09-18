if test -e /opt/homebrew/bin/brew
    eval "$(/opt/homebrew/bin/brew shellenv)"
end

if status is-interactive
    set fish_tmux_default_session_name home
    set fish_tmux_autostart true
end

# hydro
set -g hydro_color_pwd $fish_color_cwd
set -g hydro_color_git $fish_color_grey
set -g hydro_color_prompt $fish_color_user
set -g hydro_multiline true
set -g hydro_symbol_git_dirty "*"
set -g hydro_symbol_prompt "❯❯"
set -g hydro_cmd_duration_threshold 5000

set --universal pure_check_for_new_release false
set --universal pure_enable_container_detection false

#set LANG en_US.UTF-8
set -U fish_greeting

#function fish_greeting
#    fastfetch --config examples/13
#end

# Format man pages
set -x MANROFFOPT -c
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -x -U GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin

fish_add_path ~/.local/bin ~/.local/scripts ~/.nbgos/bin

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
# bind \cs tmux-sessionizer

abbr -a gco git checkout
abbr -a gst git status

# Set up fzf key bindings
fzf --fish | source

zoxide init fish | source
