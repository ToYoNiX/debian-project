#!/bin/bash
#

echo "Installing and configuring UFW firewall..."

# Update package list
sudo apt update

# Attempt to install GUFW up to 3 times
package="gufw"
for (( attempt=1 ; attempt<=3 ; attempt++ )); do
    echo "Attempt number $attempt: Installing $package..."
    sudo apt install -y "$package"

    # Check if GUFW is installed successfully
    if dpkg -l | grep -q "$package"; then
        echo "$package installed successfully."
        break
    else
        echo "Failed to install $package. Retrying..."
    fi
done

# Check if GUFW was installed successfully
if ! dpkg -l | grep -q "$package"; then
    echo "Failed to install $package after multiple attempts."
    exit 1
fi

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

# Allow Syncthing (file synchronization)
sudo ufw allow syncthing

# Set default policies
sudo ufw default deny incoming  # Deny all incoming connections by default
sudo ufw default allow outgoing # Allow all outgoing connections by default

# Enable UFW
echo "Enabling UFW..."
sudo ufw enable

echo "UFW installation and configuration completed successfully."
