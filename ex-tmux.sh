#!/bin/sh
# initial pane
tmux new-session -d 'vim'
# vertically split 1st pane and open "htop"
tmux split-window -v 'htop'
# |--------------------|
# |          |         |
# |          |         |
# |    2nd   |   1st   |
# |          |         |
# |          |         |
# |--------------------|
# horizontal split 
tmux split-window -h
# |--------------------|
# |                    |
# |         3rd        |
# |                    |
# |--------------------|
# |          |         |
# |    2nd   |   1st   |
# |          |         |
# |--------------------|
# open new window running 'weechat'
tmux new-window 'weechat'
# attach theses 2 windows to session
tmux -2 attach-session -d 

# tmux new-session \; \
  # send-keys 'tail -f /var/log/dpkg.log' C-m \; \
  # split-window -v -p 75 \; \
  # split-window -h -p 30 \; \
  # send-keys 'top' C-m \; \
  # select-pane -t 1 \; \
  # split-window -v \; \
  # send-keys 'weechat' C-m \;
