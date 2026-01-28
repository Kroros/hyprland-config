#!/bin/sh

PLAYER=$(cat ~/.cache/eww/current_player 2>/dev/null || echo spotify)

playerctl --follow metadata \
    --player "$PLAYER" \
    --format '{{title}}'
