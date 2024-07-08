#!/bin/bash
#

# Install the driver
echo "Do you want to install Nvidia drivers? (y/n)"
read -r install_nvidia

if [[ $install_nvidia == "y" || $install_nvidia == "Y" ]]; then
    echo "Installing Nvidia drivers..."

    # Install the driver
    sudo apt install nvidia-driver

    # Add nvidia drm to grub
    sudo tee /etc/default/grub.d/nvidia-modeset.cfg <<EOF
GRUB_CMDLINE_LINUX="\$GRUB_CMDLINE_LINUX nvidia-drm.modeset=1"
EOF
    sudo update-grub

    # For gnome
    sudo ln -s /dev/null /etc/udev/rules.d/61-gdm.rules

    echo "Nvidia drivers installed successfully."
else
    echo "Skipping Nvidia drivers installation."
fi
