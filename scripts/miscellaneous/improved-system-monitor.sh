#!/bin/bash
#

echo "Removing GNOME System Monitor and installing Mission Control from Flathub..."

# Remove GNOME System Monitor
echo "Attempting to remove GNOME System Monitor..."
sudo apt purge gnome-system-monitor -y

# Check if removal was successful
if dpkg -l | grep -q "gnome-system-monitor"; then
    echo "Failed to remove GNOME System Monitor."
    exit 1
else
    echo "GNOME System Monitor removed successfully."
fi

# Install Mission Control from Flathub
echo "Installing Mission Control from Flathub..."

# Ensure flatpak is installed
if ! command -v flatpak &> /dev/null; then
    echo "Flatpak is not installed. Please install Flatpak and try again."
    exit 1
fi

# Install the application
if flatpak install flathub io.missioncenter.MissionCenter -y; then
    echo "Mission Control installed successfully."
else
    echo "Failed to install Mission Control."
    exit 1
fi

echo "Script completed successfully."
