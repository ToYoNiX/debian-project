#!/bin/bash
#

echo "Installing Flatpak and GNOME Software Plugin for Flatpak..."

# Define packages to install
packages="flatpak gnome-software-plugin-flatpak"

# Attempt to install packages up to 3 times
for (( attempt=1 ; attempt<=3 ; attempt++ )); do
    echo "Attempt number $attempt: Installing $packages..."
    sudo apt update
    sudo apt install -y $packages

    # Check if all packages are installed successfully
    all_installed=true
    for package in $packages; do
        if ! dpkg -l | grep -q "$package"; then
            all_installed=false
            break
        fi
    done

    if $all_installed; then
        echo "All packages installed successfully."
        break
    else
        echo "Failed to install some packages. Retrying..."
    fi
done

# Check if all packages were installed successfully
if ! $all_installed; then
    echo "Failed to install one or more packages after multiple attempts."
    exit 1
fi

# Add Flathub repository if not already added
echo "Adding Flathub repository..."
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo "Flatpak and repository setup completed successfully."
