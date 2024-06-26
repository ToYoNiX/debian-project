#!/bin/bash
#

URL=$(wget -q -O - https://api.github.com/repos/obsidianmd/obsidian-releases/releases/latest | grep 'deb"$' | awk -F'"' ' {print $4} ')
wget $URL
sudo apt install ./obsidian-*
rm obsidian-*
