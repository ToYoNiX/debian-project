#!/bin/bash
#

if [[ $install_grommit =~ ^[Yy]$ ]]; then
    echo "Installing Grommit-mpx..."

    # The installation of Grommit-mpx
    sudo apt install gromit-mpx

    echo "Grommit-mpx installed successfully."
else
    echo "Skipping Grommit-mpx installation."
fi
