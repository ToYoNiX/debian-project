#!/bin/bash
#

# Add vscode repo
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f packages.microsoft.gpg

# Install vscode
sudo apt install apt-transport-https
sudo apt update
sudo apt install code -y

# Install runners, compiles, etc..
sudo apt install vim gcc g++ gdb python3 python3-pygame python3-sklearn python3-pandas python3-numpy python3-seaborn jupyter-notebook openjdk-17-jdk openjdk-17-jre arduino python3-serial ftdi-eeprom libcanberra-gtk-module libcanberra-gtk3-module -y

# Add user to dialout group
sudo usermod -aG dialout $USER

