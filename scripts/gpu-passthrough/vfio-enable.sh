#!/bin/bash
#

# Define gpu ids in grub config
sudo tee /etc/default/grub.d/nvidia-modeset.cfg <<EOF
GRUB_CMDLINE_LINUX="\$GRUB_CMDLINE_LINUX amd_iommu=on vfio-pci.ids=10de:2507,10de:228e"
EOF
sudo update-grub

# Blacklist nvidia drivers
sudo tee /etc/modprobe.d/blacklist.conf <<EOF
blacklist nouveau
blacklist nvidia
EOF

# Load vfio early
sudo tee /etc/modprobe.d/vfio.conf <<EOF
options vfio-pci ids=10de:2507,10de:228e
EOF

sudo update-initramfs -u

