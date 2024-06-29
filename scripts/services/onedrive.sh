#!/bin/bash
#

# Add the OpenSuSE Build Service repository release key
wget -qO - https://download.opensuse.org/repositories/home:/npreining:/debian-ubuntu-onedrive/Debian_12/Release.key | gpg --dearmor | sudo tee /usr/share/keyrings/obs-onedrive.gpg > /dev/null

# Add the OpenSuSE Build Service repository
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/obs-onedrive.gpg] https://download.opensuse.org/repositories/home:/npreining:/debian-ubuntu-onedrive/Debian_12/ ./" | sudo tee /etc/apt/sources.list.d/onedrive.list

# Install onedrive
sudo apt-get update 
sudo apt install --no-install-recommends --no-install-suggests onedrive -y

# Run onedrive
systemctl --user enable onedrive
onedrive --synchronize
