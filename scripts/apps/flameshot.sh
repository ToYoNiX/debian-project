#!/bin/bash

echo "Do you want to install flameshot ? (y/n)"

read -r install_flameshot

if [[ $install_flameshot == "y" || $install_flameshot == "Y" ]]; then
    echo "Installing flamshot .."
    sudo apt install flameshot -y

else
    echo "Skipping flameshot installation"
    echo "--------------------------------"
fi
