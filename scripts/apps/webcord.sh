#!/bin/bash
#

echo "Installing Webcord..."
URL=$(wget -q -O - https://api.github.com/repos/SpacingBat3/WebCord/releases/latest | grep 'amd64.deb"$' | awk -F'"' ' {print $4} ')
wget $URL -O webcord.deb
sudo apt install ./webcord.deb
rm webcord.deb
echo "webcord installed successfully."
