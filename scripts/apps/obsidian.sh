#!/bin/bash
#

read -p "Do you want to install Obsidian? (y/n): " choice
if [[ $choice == "y" || $choice == "Y" ]]; then
    echo "Installing Obsidian..."
    URL=$(wget -q -O - https://api.github.com/repos/obsidianmd/obsidian-releases/releases/latest | grep 'deb"$' | awk -F'"' ' {print $4} ')
    wget $URL
    sudo apt install ./obsidian-*
    rm obsidian-*
    echo "Obsidian installed successfully."
else
    echo "Obsidian installation skipped."
fi
