#!/bin/bash
#

sudo apt install wget -y
wget https://github.com/fastfetch-cli/fastfetch/releases/latest/download/fastfetch-linux-amd64.deb
sudo apt install ./fastfetch-linux-amd64.deb -y
rm fastfetch-linux-amd64.deb
