#!/bin/sh

#https://github.com/altercation/mutt-colors-solarized

vimrc="$HOME/.vimrc"
taskrc="$HOME/.taskrc"
tmuxrc="$HOME/.tmux.conf"

current_hour="$(date -- +%k)"

# TODO: bash dictionaries
# declare -A animals                        create
# animals=(["cow"]="moo" ["dog"]="woof")    assign
# echo "${animals[@]}"                      values
# echo "${!animals[@]}"                     keys
# echo "${animals["dog"]}"                  key access

main() {
  if test $# -eq 0; then
    if test $current_hour -gt 16; then
      set_theme "dark" "black" "brightblue" "brightgreen" "forest"
    else
      set_theme "light" "white" "brightyellow" "brightcyan" "desert"
    fi
  elif test $# -eq 1; then
    case "$1" in
      -h|--help)
        echo "NO HELP FOR YOU"
        exit 0
        ;;
      -d|--dark)
        set_theme "dark" "black" "brightblue" "brightgreen" "forest"
        exit 0
        ;;
      -l|--light)
        set_theme "light" "white" "brightyellow" "brightcyan" "desert"
        exit 0
        ;;
      -?*)
        printf "Unknown option '%s'\n" "$1"
        exit 0
    esac
  fi
}


set_theme() {
  # vim
  sed --in-place "s/background=[a-z]*/background=$1/" "$vimrc"
  # taskwarrior
  sed --in-place "s/solarized-[a-z]*/solarized-$1/" "$taskrc"
  # tmux
  sed --in-place "s/status-style fg=yellow,bg=[a-z]*/status-style fg=yellow,bg=$2/" "$tmuxrc"
  sed --in-place "s/window-status-style fg=[a-z]*,bg=default/window-status-style fg=$3,bg=default/" "$tmuxrc"
  sed --in-place "s/pane-border-style fg=[a-z]*/pane-border-style fg=$2/" "$tmuxrc"
  sed --in-place "s/pane-active-border-style fg=[a-z]*/pane-active-border-style fg=$4/" "$tmuxrc"
  sed --in-place "s/message-style fg=brightred,bg=[a-z]*/message-style fg=brightred,bg=$2/" "$tmuxrc"
  sed --in-place "s/window-status-bell-style fg=[a-z]*,bg=red/window-status-bell-style fg=$2,bg=red/" "$tmuxrc"
  # nb
  nb set color_theme "$5" > /dev/null
}

main "$@"
