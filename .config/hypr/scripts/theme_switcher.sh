#!/bin/bash

#Change wallpaper set
WALLPAPER_DIR="/mnt/hdd/wallpapers/"
echo $1 > $HOME/.cache/hypr_current_theme

WALLPAPER1=$(grep -w ".*$1.*" $HOME/.config/hypr/themes/wp_tags.txt | cut -d: -f1 | shuf -n 1)
WALLPAPER2=$(grep -w ".*$1.*" $HOME/.config/hypr/themes/wp_tags.txt | cut -d: -f1 | shuf -n 1)

WP_PATH1="${WALLPAPER_DIR}${WALLPAPER1}"
WP_PATH2="${WALLPAPER_DIR}${WALLPAPER2}"


awww img $WP_PATH1 -o DP-1 --transition-type wipe
awww img $WP_PATH2 -o HDMI-A-1 --transition-type wipe

#Theme switching strategy:
#  For each theme, make a hypr config file, e.g /themes/hypr_nature.conf
#  and a colours file. e.g. /themes/hypr_nature_colours.json.
#  Source the theme in hyprland.conf, e.g. source = ~/.config/hypr/themes/hypr_nature.conf
#  In the theme config, define relevant decorations and colours,
#  on startup of this file call theme_switcher (this script).
#  This script will use sed to change the config files of relevant utilities.
#  Reload relevant utils
#
#
