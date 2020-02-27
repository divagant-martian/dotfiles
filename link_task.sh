#!/bin/bash
tc=~/.config/task
trc=$tc/taskrc
echo "set -gx TASKRC $trc" >> ~/.config/fish/config.fish
echo TASKRC=$trc >> ~/.profile
rm -rf $tc && mkdir -p $tc
ln -s $(pwd)/task/taskrc $trc
echo 'include '$(pwd)/task/darkokai.theme >> $trc
