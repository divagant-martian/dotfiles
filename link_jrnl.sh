#!/bin/sh
rm -rf ~/.config/jrnl && mkdir -p ~/.config/jrnl/
# pikaur -S neovim-plug
# pip install --user --force pynvim msgpack
ln -sf $(pwd)/jrnl/jrnl.yaml ~/.config/jrnl/jrnl.yaml

