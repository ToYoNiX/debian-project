#!/bin/bash

echo "Installing and configuring UFW firewall..."

# Check for Debian or Fedora
if [ -f /etc/debian_version ]; then
    echo "Detected Debian-based distribution."
    PACKAGE_MANAGER="apt"
elif [ -f /etc/redhat-release ]; then
    echo "Detected Fedora-based distribution."
    PACKAGE_MANAGER="dnf"
else
    echo "Unsupported distribution."
    exit 1
fi

# Update package list
sudo $PACKAGE_MANAGER update

# Attempt to install UFW up to 3 times
package="ufw"
for (( attempt=1 ; attempt<=3 ; attempt++ )); do
    echo "Attempt number $attempt: Installing $package..."
    sudo $PACKAGE_MANAGER install -y "$package"

    # Check if UFW is installed successfully
    if command -v ufw >/dev/null 2>&1; then
        echo "$package installed successfully."
        break
    else
        echo "Failed to install $package. Retrying..."
    fi
done

# Check if UFW was installed successfully
if ! command -v ufw >/dev/null 2>&1; then
    echo "Failed to install $package after multiple attempts."
    exit 1
fi

# Enabling ufw
sudo systemctl enable ufw

# Configure UFW firewall rules
echo "Configuring UFW rules..."

# Limit SSH access to prevent brute-force attacks
sudo ufw limit 22/tcp

# Allow HTTP and HTTPS traffic
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp

# Allow KDE Connect (communication between devices)
sudo ufw allow 1714:1764/udp
sudo ufw allow 1714:1764/tcp

# Enable syncthing with ufw
sudo ufw allow 22000/tcp
sudo ufw allow 22000/udp


# Set default policies
sudo ufw default deny incoming  # Deny all incoming connections by default
sudo ufw default allow outgoing # Allow all outgoing connections by default

# Enable UFW
echo "Enabling UFW..."
sudo ufw enable

echo "UFW installation and configuration completed successfully."
