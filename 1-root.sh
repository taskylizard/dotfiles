#!/bin/bash

# Change Debian to SID Branch
cp /etc/apt/sources.list /etc/apt/sources.list.bak
cp sources.list /etc/apt/sources.list 

username=$(id -u -n 1000)
builddir=$(pwd)

# update
apt update

# base pkgs
apt install unzip i3 sddm rofi git lxpolkit lxappearance xorg hsetroot neofetch -y
apt install fonts-font-awesome libqt5svg5 qml-module-qtquick-controls -y

# dependencies 
apt install libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libpcre3-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev meson -y
# fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip && unzip FiraCode.zip -d /usr/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip && unzip JetBrainsMono.zip -d /usr/share/fonts
fc-cache -vf


cd $builddir
mkdir -p /home/$username/.config
git clone https://github.com/taskylizard/dotfiles
cp dotfiles/zshrc ~/.zshrc
cp -R dotfiles/* /home/$username/.config/
chown -R $username:$username /home/$username