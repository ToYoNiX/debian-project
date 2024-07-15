#!/bin/bash

echo "Do you want to install discord? (y/n)"
read -r install_discord

if [[ $install_discord == "y" || $install_discord == "Y" ]]; then
    echo "--------------------"
    echo "Installing Discord, please wait .."
    sudo flatpak -y install flathub com.discordapp.Discord
else
    echo "Skipping discord installation."
    echo "---------------------"
fi
