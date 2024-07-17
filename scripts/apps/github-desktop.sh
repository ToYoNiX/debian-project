#!/bin/bash
#

echo "Do you want to install github desktop app? (y/n)"

read -r user_option

if [[ $user_option == "y" || $user_option == "Y" ]]; then
    echo "Installing Github Desktop app .."
    bash -c "$(wget -O- https://raw.githubusercontent.com/kontr0x/github-desktop-install/main/installGitHubDesktop.sh)"

else
    echo "Skipping Github Desktop app"
fi

echo "-----------------------------------"
