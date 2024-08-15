#!/bin/bash
#

echo "Adding Syncthing repository and installing Syncthing..."

# Add the release PGP key
echo "Adding PGP key for Syncthing..."
sudo mkdir -p /etc/apt/keyrings
if sudo curl -L -o /etc/apt/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg; then
    echo "PGP key added successfully."
else
    echo "Failed to add PGP key."
    exit 1
fi

# Add the Syncthing repository
echo "Adding Syncthing repository to APT sources..."
echo "deb [signed-by=/etc/apt/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list

# Update package list and install Syncthing
echo "Updating package list and installing Syncthing..."
sudo apt-get update
if sudo apt-get install -y syncthing; then
    echo "Syncthing installed successfully."
else
    echo "Failed to install Syncthing."
    exit 1
fi

echo "Syncthing installation completed successfully."
