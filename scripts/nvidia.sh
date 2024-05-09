#!/bin/bash
#

# Install the driver
sudo apt install nvidia-driver

# Add nvidia drm to grub
sudo sh -c "echo 'GRUB_CMDLINE_LINUX="$GRUB_CMDLINE_LINUX nvidia-drm.modeset=1"' > /etc/default/grub.d/nvidia-modeset.cfg"
sudo update-grub

# For gnome
sudo ln -s /dev/null /etc/udev/rules.d/61-gdm.rules
