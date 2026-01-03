#!/bin/sh

COLOUR=$(hyprpicker)
notify-send $COLOUR
wl-copy $COLOUR
