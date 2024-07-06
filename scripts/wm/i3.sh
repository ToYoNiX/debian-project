#!/bin/bash
#

if ! command -v i3wm >/dev/null 2>&1; then
    echo "** Installing i3..."
    # Install i3
    sudo apt install i3 -y

    # Install bumblebee-status and pango font
    sudo apt install bumblebee-status fonts-noto-color-emoji -y
    echo "i3 with Bumblebee-status and pango font are installed successfully."
else
    echo "i3 is already installed."
fi
