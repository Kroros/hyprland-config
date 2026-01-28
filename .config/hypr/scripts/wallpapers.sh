#!/bin/bash

WALLPAPER_DIR="/mnt/hdd/wallpapers/"
DEFAULT_INTERVAL=900
PID_FILE="$HOME/.cache/hypr_wallpaper.pid"
THEME_FILE="$HOME/.cache/hypr_current_theme"

if [[ -f "$PIDFILE" ]]; then
    OLD_PID=$(cat "$PIDFILE")
    if kill -0 "$OLD_PID" 2>/dev/null; then
        kill "$OLD_PID"
    fi
fi

echo $$ > "$PID_FILE"

trap 'rm -f "$PID_FILE"' EXIT

WP1_INIT=$(grep -w ".*$THEME.*" $HOME/.config/hypr/themes/wp_tags.txt | cut -d: -f1 | shuf -n 1)
WP2_INIT=$(grep -w ".*$THEME.*" $HOME/.config/hypr/themes/wp_tags.txt | cut -d: -f1 | shuf -n 1)
WP3_INIT=$(grep -w ".*$THEME.*" $HOME/.config/hypr/themes/wp_tags.txt | cut -d: -f1 | shuf -n 1)

WP_PATH_INIT1="${WALLPAPER_DIR}${WP1_INIT}"
WP_PATH_INIT2="${WALLPAPER_DIR}${WP2_INIT}"
WP_PATH_INIT3="${WALLPAPER_DIR}${WP3_INIT}"

$HOME/.awww/awww/target/release/awww img $WP_PATH_INIT1 -o DP-1 --transition-type wipe
$HOME/.awww/awww/target/release/awww img $WP_PATH_INIT2 -o HDMI-A-1 --transition-type wipe
$HOME/.awww/awww/target/release/awww img $WP_PATH_INIT3 -o DP-2 --transition-type wipe


while true; do
    THEME=$(cat "$THEME_FILE" 2>/dev/null || echo "")

    WALLPAPER1=$(grep -w ".*$THEME.*" $HOME/.config/hypr/themes/wp_tags.txt | cut -d: -f1 | shuf -n 1)
    WALLPAPER2=$(grep -w ".*$THEME.*" $HOME/.config/hypr/themes/wp_tags.txt | cut -d: -f1 | shuf -n 1)
    WALLPAPER3=$(grep -w ".*$THEME.*" $HOME/.config/hypr/themes/wp_tags.txt | cut -d: -f1 | shuf -n 1)

    WP_PATH1="${WALLPAPER_DIR}${WALLPAPER1}"
    WP_PATH2="${WALLPAPER_DIR}${WALLPAPER2}"
    WP_PATH3="${WALLPAPER_DIR}${WALLPAPER3}"

    $HOME/.awww/awww/target/release/awww img $WP_PATH1 -o DP-1 --transition-type wipe
    $HOME/.awww/awww/target/release/awww img $WP_PATH2 -o HDMI-A-1 --transition-type wipe
    $HOME/.awww/awww/target/release/awww img $WP_PATH4 -o DP-2 --transition-type wipe

    sleep "$DEFAULT_INTERVAL"
done
