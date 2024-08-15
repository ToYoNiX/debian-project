#!/bin/bash
#

echo "Resetting APT package manager..."

# Remove cached package lists
sudo rm -rfv /var/lib/apt/lists/*

# Clean up temporary files and package cache
sudo apt-get clean

# Update package list from repositories
if sudo apt-get update; then
    echo "Package list updated successfully."
else
    echo "Failed to update package list."
    exit 1
fi

# Upgrade installed packages
if sudo apt-get upgrade -y; then
    echo "Packages upgraded successfully."
else
    echo "Failed to upgrade packages."
    exit 1
fi

echo "APT reset completed successfully."
