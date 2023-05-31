#!/bin/zsh

curDir=$(pwd)

ln -sfF ${curDir}/../nvim/init.lua ~/.config/nvim/init.lua
ln -sfF ${curDir}/../nvim/lua ~/.config/nvim/lua
ln -sfF ${curDir}/../nvim/after ~/.config/nvim/after

ln -sfF ${curDir}/../.gitconfig ~/.gitconfig
ln -sfF ${curDir}/../.gitignore ~/.gitignore

ln -sfF ${curDir}/../.tmux.conf ~/.tmux.conf
ln -sfF ${curDir}/../.zshrc ~/.zshrc
ln -sfF ${curDir}/../kitty.conf ~/.config/kitty/kitty.conf
