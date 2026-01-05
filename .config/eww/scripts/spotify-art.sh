#!/bin/sh

TITLE=$(playerctl metadata --format {{album}} -p spotify)
SAFE_TITLE=$(printf "%s" "$TITLE" | tr '/ ' '__')
URL=$(playerctl metadata mpris:artUrl -p spotify)
IMG_PATH="/tmp/$SAFE_TITLE-art.png"

curl -s "$URL" -o "$IMG_PATH"
echo $IMG_PATH
