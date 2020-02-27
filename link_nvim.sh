#!/bin/sh
rm -r ~/.config/nvim
# pikaur -S neovim-plug
# pip install --user --force pynvim msgpack
ln -sf $(pwd)/nvim ~/.config/nvim
