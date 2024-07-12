#!/bin/bash

flipper_repo=~/Documents/GitHub/Flipper

# Exit if flipper repo path doesn't check out
if [ -f "$flipper_repo/flipperSync.sh" ]; then
    echo "Flipper repo found at $flipper_repo"
else
  echo "Flipper repo not found"
  exit
fi

# Check if run from root of SD Card
if [ -f "Manifest" ]; then
    mkdir -p Flipper
    rsync -ahP --exclude '.git*' --exclude 'flipperSync.sh' --exclude '*.mp4' --exclude '*.png' --exclude '*.jp*' $flipper_repo/ Flipper/
else
    echo "Please run this script from the root of the SD card like this: ./flipperSync.sh"
    exit
fi