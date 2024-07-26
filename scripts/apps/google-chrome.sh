#!/bin/bash
#

if command -v google-chrome &> /dev/null ; then
    echo "Google chrome is already installed."
    exit 0
fi

chromeInstall () {
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo apt install ./google-chrome-stable_current_amd64.deb -y
    rm google-chrome-stable_current_amd64.deb
}

for (( attempt=1 ; attempt<=3 ; attempt++ )); do
    echo "Installing Chrome - attempt number:" $attempt
    chromeInstall

    if command -v google-chrome &> /dev/null ; then
        break
    fi
done

if command -v google-chrome &> /dev/null ; then
    echo "Google chrome is installed successfully."
else
    echo "Something went wrong. -> Google chrome."
    exit 1
fi