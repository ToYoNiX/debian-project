#!/bin/bash
#

if ! command -v sway >/dev/null 2>&1; then
    echo "** Installing Sway..."
    sudo apt install sway waybar wofi wdisplays xdg-desktop-portal xdg-desktop-portal-wlr xdg-desktop-portal-gtk -y
    echo "Sway installed successfully."
else
    echo "Sway is already installed."
fi
