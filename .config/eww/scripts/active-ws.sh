#!/bin/sh

handle() {
    case $1 in
        focusedmon*|workspace*|createworkspace*|destroyworkspace*|openwindow*|closewindow*) hyprctl activeworkspace -j | jq '.id' ;;
    esac
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done