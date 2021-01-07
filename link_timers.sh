#!/bin/sh
rm -rf ~/.config/systemd/user && mkdir -p ~/.config/systemd/user
ln -sf $(pwd)/timers/* ~/.config/systemd/user/
systemctl --user enable ~/.config/systemd/user/*.timer
ls $(pwd)/timers/*.timer | xargs -n 1 basename | xargs systemctl --user start
systemctl --user list-timers
