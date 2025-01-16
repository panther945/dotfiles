if status is-interactive
    # Commands to run in interactive sessions can go here
end

set LANG en_US.UTF-8
set -g async_prompt_functions _pure_prompt_git
set -U fish_greeting

abbr ls lsd
abbr ll "lsd -l"
abbr la "lsd -la"
abbr gco "git checkout"
abbr gst "git status"

zoxide init fish | source
