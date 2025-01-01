#!/bin/bash

echo "Installing command line tools"
sudo dnf install -y zoxide fzf eza ripgrep fd-find stow

echo "Installing tmux"
sudo dnf install -y tmux
stow tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Installing Oh-My-Zsh"
sudo dnf install -y zsh curl
stow zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
if [ "$(basename -- "$SHELL")" != "zsh" ]; then
    chsh -s "$(which zsh)"
fi
