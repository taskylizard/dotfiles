#!/bin/sh

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
dotfiles config --local remote.origin.fetch '+refs/heads/*:refs/remotes/origin/*'
