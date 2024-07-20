#!/bin/bash
#

if command -v google-chrome &> /dev/null ; then
    echo "Google chrome is already installed."
    exit 0
fi

chromeInstall () {
    echo "Installing Chrome"
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo apt install ./google-chrome-stable_current_amd64.deb -y
    rm google-chrome-stable_current_amd64.deb
}

while ! command -v google-chrome &> /dev/null ; do
    chromeInstall
done

if command -v google-chrome &> /dev/null ; then
    echo "Google chrome is installed successfully."
else
    echo "Something went wrong. -> Brave Browser."
    exit 1
fi