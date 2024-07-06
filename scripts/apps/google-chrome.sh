#!/bin/bash
#

if ! command -v google-chrome >/dev/null 2>&1; then
    echo "** Installing Google Chrome...**"
    sudo apt install wget -y
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo apt install ./google-chrome-stable_current_amd64.deb -y
    rm google-chrome-stable_current_amd64.deb
else
    echo "Google Chrome is already installed."
fi
