#!/bin/bash
#

if command -v webcord &> /dev/null ; then
    echo "Webcord is already installed."
    exit 0
fi

webcordInstall () {
    echo "Downloading the latest version of Webcord..."
    URL=$(wget -q -O - https://api.github.com/repos/SpacingBat3/WebCord/releases/latest | grep 'amd64.deb"$' | awk -F'"' '{print $4}')
    wget $URL -O webcord_latest_amd64.deb
    sudo apt install ./webcord_latest_amd64.deb -y
    rm webcord_latest_amd64.deb
}

for (( attempt=1 ; attempt<=3 ; attempt++ )); do
    echo "Installing Webcord - attempt number:" $attempt
    webcordInstall

    if command -v webcord &> /dev/null ; then
        break
    fi
done

if command -v webcord &> /dev/null ; then
    echo "Webcord installed successfully."
else
    echo "Something went wrong. -> Webcord."
    exit 1
fi