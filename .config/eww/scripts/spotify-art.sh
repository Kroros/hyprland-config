#!/bin/sh

COVER_URL=$(playerctl metadata mpris:artUrl)

curl -s "$COVER_URL" -o /tmp/album-art.png