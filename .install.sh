#!/bin/bash

git clone --bare https://github.com/taskylizard/dotfiles.git "$HOME"/.dotfiles

git --git-dir="$HOME"/.dotfiles --work-tree="$HOME" checkout master
source .setup/init.sh

zsh "$HOME"/.scripts/install/all.sh
