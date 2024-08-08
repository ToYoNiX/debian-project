#!/bin/bash
#

echo "Installing Obsidian..."
URL=$(wget -q -O - https://api.github.com/repos/obsidianmd/obsidian-releases/releases/latest | grep 'deb"$' | awk -F'"' ' {print $4} ')
wget $URL -O obsidian.deb
chmod +x obsidian.deb
sudo apt install ./obsidian.deb
rm obsidian.deb
echo "Obsidian installed successfully."
