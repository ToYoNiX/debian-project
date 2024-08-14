#!/bin/bash
#

if command -v obsidian &> /dev/null ; then
    echo "Obsidian is already installed."
    exit 0
fi

obsidianInstall () {
    echo "Downloading the latest version of Obsidian..."
    URL=$(wget -q -O - https://api.github.com/repos/obsidianmd/obsidian-releases/releases/latest | grep 'deb"$' | awk -F'"' '{print $4}')
    wget $URL -O obsidian_latest_amd64.deb
    sudo apt install ./obsidian_latest_amd64.deb -y
    rm obsidian_latest_amd64.deb
}

for (( attempt=1 ; attempt<=3 ; attempt++ )); do
    echo "Installing Obsidian - attempt number:" $attempt
    obsidianInstall

    if command -v obsidian &> /dev/null ; then
        break
    fi
done

if command -v obsidian &> /dev/null ; then
    echo "Obsidian installed successfully."
else
    echo "Something went wrong. -> Obsidian."
    exit 1
fi