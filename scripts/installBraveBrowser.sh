#!/bin/bash

# Import Brave's signing key
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A8580BDC82D3DC6C

# Add Brave's repository to the system's software sources
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list > /dev/null

# Update the package index
sudo apt update

# Install Brave browser
sudo apt install brave-browser -y

echo "Brave browser installed successfully."
