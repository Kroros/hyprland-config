#!/bin/sh

handle() {
    case $1 in
        focusedmon*|workspace*|createworkspace*|destroyworkspace*|openwindow*|closewindow*) hyprctl workspaces -j | jq -r 'map(select(.windows > 0)) | map(.id) | join(",")' ;;
    esac
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done