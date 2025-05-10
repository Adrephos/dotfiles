#!/usr/bin/env bash
#
tmux new -d -s "apolo"
tmux send-keys -t "apolo" C-z 'apolo_ssh_tmux' Enter
tmux attach -t apolo
