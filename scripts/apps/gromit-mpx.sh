#!/bin/bash
#

echo "Do you want to install Grommit-mpx?"
echo "Grommit-mpx is an app that allows you to write on the screen. (y/n)"
read -r install_grommit
if [[ $install_grommit =~ ^[Yy]$ ]]; then
    echo "Installing Grommit-mpx..."

    # The installation of Grommit-mpx
    sudo apt install gromit-mpx

    echo "Grommit-mpx installed successfully."
else
    echo "Skipping Grommit-mpx installation."
fi
