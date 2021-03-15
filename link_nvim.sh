#!/bin/sh
rm -rf ~/.config/nvim
ln -sf $(pwd)/nvim ~/.config/nvim
echo 'falta instalar plug según https://github.com/junegunn/vim-plug y luego :PlugInstall'
