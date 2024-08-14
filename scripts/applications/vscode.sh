#!/bin/bash
#

if command -v code &> /dev/null ; then
    echo "Visual Studio Code is already installed."
    exit 0
fi

vscodeInstall () {
    echo "Installing dependencies..."
    sudo apt-get install wget gpg -y
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
    echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
    rm -f packages.microsoft.gpg
    sudo apt install apt-transport-https -y
    sudo apt update
    sudo apt install code -y
}

for (( attempt=1 ; attempt<=3 ; attempt++ )); do
    echo "Installing Visual Studio Code - attempt number:" $attempt
    vscodeInstall

    if command -v code &> /dev/null ; then
        break
    fi
done

if command -v code &> /dev/null ; then
    echo "Visual Studio Code installed successfully."
else
    echo "Something went wrong. -> Visual Studio Code."
    exit 1
fi
