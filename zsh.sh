#!/usr/bin/env bash

source ./cp_conf.sh

apt install -y exa bat fd fzf wget unzip which git zsh 

# 从 github clone 插件
GITHUB_PROXY="${GITHUB_PROXY:-https://ghproxy.com/}"
git clone --depth=1 ${GITHUB_PROXY}https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
git clone --depth=1 ${GITHUB_PROXY}https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 ${GITHUB_PROXY}https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone --depth=1 ${GITHUB_PROXY}https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 ${GITHUB_PROXY}https://github.com/Aloxaf/fzf-tab.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
git clone --depth=1 ${GITHUB_PROXY}https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

cp_conf_home ".zshrc"
cp_conf_home ".p10k.zsh"

chsh -s zsh
