#!/bin/bash
#

echo "Installing essential packages..."

# Define the packages to install
packages="vim curl wget tree uget gparted obs-studio handbrake pavucontrol"

# Update package list
sudo apt update

# Attempt to install each package
for package in $packages; do
    echo "Installing $package..."
    sudo apt install -y "$package"

    # Check if the package was installed successfully
    if dpkg -l | grep -q "$package"; then
        echo "$package installed successfully."
    else
        echo "Failed to install $package."
        exit 1
    fi
done

echo "All packages installed successfully."
