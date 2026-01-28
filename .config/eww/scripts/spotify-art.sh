#!/bin/sh

PLAYER="spotify"
TITLE=$(playerctl metadata --format {{album}} -p $PLAYER)
SAFE_TITLE=$(printf "%s" "$TITLE" | tr '/ ' '__')
URL=$(playerctl metadata mpris:artUrl -p spotify)
IMG_PATH="/tmp/$SAFE_TITLE-art.png"

curl -s "$URL" -o "$IMG_PATH"
echo $IMG_PATH
