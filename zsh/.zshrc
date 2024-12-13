if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  fzf-tab
  git
  brew
  golang
  zsh-autosuggestions
  zsh-syntax-highlighting
  fzf
)

source $ZSH/oh-my-zsh.sh

# User configuration
export LANG=en_US.UTF-8
export PATH=$PATH:$HOME/go/bin
export FZF_BASE=$(which fzf)

# zstyle ':completion:*' menu no

eval "$(zoxide init zsh)"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
