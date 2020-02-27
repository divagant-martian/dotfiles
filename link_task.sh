#!/bin/bash
tc=~/.config/task
trc=$tc/taskrc
echo "set -gx TASKRC $trc" >> ~/.config/fish/config.fish
rm -rf $tc && mkdir -p $tc
ln -sf $(pwd)/task/taskrc $trc
echo 'include '$(pwd)/task/darkokai.theme >> $trc
