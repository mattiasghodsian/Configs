#!/bin/bash

if ! command -v xdotool &>/dev/null; then
    echo ">> xdotool is not installed. Installing..."
    sudo apt-get update
    sudo apt-get install -y xdotool
    echo ">> xdotool installed successfully."
fi

while true; do
    # Get screen dimensions
    screen_width=$(xdpyinfo | awk '/dimensions/{print $2}' | cut -d 'x' -f 1)
    screen_height=$(xdpyinfo | awk '/dimensions/{print $2}' | cut -d 'x' -f 2)

    # Generate random coordinates
    rand_x=$((RANDOM % screen_width))
    rand_y=$((RANDOM % screen_height))

    # Move mouse cursor to random position
    xdotool mousemove $rand_x $rand_y

    sleep 5
done
