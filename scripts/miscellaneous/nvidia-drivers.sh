#!/bin/bash
#

echo "Starting Nvidia driver installation..."

# Function to install Nvidia drivers
installNvidiaDrivers () {
    sudo apt update
    sudo apt install -y nvidia-driver
}

# Function to check if Nvidia drivers are installed
checkNvidiaDriverInstalled () {
    if command -v nvidia-smi &> /dev/null; then
        return 0
    else
        return 1
    fi
}

# Function to configure Nvidia DRM in GRUB
configureGrubForNvidia () {
    echo "Configuring GRUB for Nvidia DRM modeset..."
    sudo tee /etc/default/grub.d/nvidia-modeset.cfg > /dev/null <<EOF
GRUB_CMDLINE_LINUX="\$GRUB_CMDLINE_LINUX nvidia-drm.modeset=1"
EOF
    sudo update-grub || { echo "Failed to update GRUB."; exit 1; }
}

# Function to create symbolic link for GDM in GNOME
configureGnomeForNvidia () {
    echo "Configuring GNOME for Nvidia..."
    sudo ln -sf /dev/null /etc/udev/rules.d/61-gdm.rules || { echo "Failed to configure GNOME for Nvidia."; exit 1; }
}

# Attempt to install Nvidia drivers up to 3 times
for (( attempt=1 ; attempt<=3 ; attempt++ )); do
    echo "Installing Nvidia drivers - attempt number: $attempt"
    installNvidiaDrivers

    if checkNvidiaDriverInstalled; then
        echo "Nvidia drivers installed successfully."
        break
    else
        echo "Failed to install Nvidia drivers. Retrying..."
    fi
done

# Final check to confirm installation
if checkNvidiaDriverInstalled; then
    configureGrubForNvidia
    configureGnomeForNvidia
    echo "Nvidia drivers installed and configured successfully."
else
    echo "Something went wrong. Nvidia drivers were not installed."
    exit 1
fi
