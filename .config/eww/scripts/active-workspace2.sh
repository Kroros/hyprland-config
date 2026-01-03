#!/usr/bin/env bash

hyprctl activeworkspace -j | jq '.id'