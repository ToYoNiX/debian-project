#!/bin/bash
#

# Install i3
sudo apt install i3 -y

mkdir -p ~/.config/i3/
cp -r ../dotfiles/.config/i3/* ~/.config/i3/

# Install bumblebee-status and pango font
sudo apt install bumblebee-status fonts-noto-color-emoji -y
echo "i3 with Bumblebee-status and pango font are installed successfully."
