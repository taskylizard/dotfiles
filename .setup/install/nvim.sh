#!/bin/bash

# version lock since i don't want annoying warnings
wget https://github.com/neovim/neovim/releases/download/v0.8.3/nvim-linux64.deb
sudo dpkg -i nvim-linux64.deb

# cleanup
rm nvim-linux64.deb
nvim --version

# astronvim
git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
