#!/bin/bash
#

if command -v brave-browser &> /dev/null ; then
    echo "Brave browser is already installed."
    exit 0
fi

braveInstall () {
    echo "Installing Brave"
    sudo apt install curl -y
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
    sudo apt update
    sudo apt install brave-browser -y
}

while ! command -v brave-browser &> /dev/null ; do
    braveInstall
done

if command -v brave-browser &> /dev/null ; then
    echo "Brave browser is installed successfully."
else
    echo "Something went wrong. -> Brave Browser."
    exit 1
fi