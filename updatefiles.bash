#!/bin/bash

cp -r ~/.config/qutebrowser .

rm -r ./xmonad
cp -r ~/.xmonad ./xmonad

cp -r ~/.xmobarrc ./xmobar/.xmobarrc

cp -r ~/.config/nvim/general ~/.config/nvim/init.vim ~/.config/nvim/keys ~/.config/nvim/plug-config ~/.config/nvim/themes ~/.config/nvim/vim-plug ./nvim

cp -r ~/.config/rofi .

cp -r ~/.config/termite .

cp -r ~/.config/alacritty .

cp -r ~/.fimrc ./fim/.fimrc

cp -r /etc/lynx.cfg /etc/lynx.lss ./lynx

cp -r ~/.tmux/tmux_new.conf .
