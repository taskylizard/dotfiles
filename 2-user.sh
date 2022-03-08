#!/bin/bash

# install picom since SID branch has outdated picom
git clone https://github.com/yshui/picom
cd picom
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build install

