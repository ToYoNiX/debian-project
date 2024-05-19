#!/bin/bash
#

sudo tee /etc/default/grub.d/nvidia-modeset.cfg <<EOF
GRUB_CMDLINE_LINUX="\$GRUB_CMDLINE_LINUX nvidia-drm.modeset=1"
EOF
sudo update-grub

sudo tee /etc/modprobe.d/blacklist.conf <<EOF
#blacklist nouveau
#blacklist nvidia
EOF

sudo tee /etc/modprobe.d/vfio.conf <<EOF
#options vfio-pci ids=10de:2507,10de:228e
EOF

sudo update-initramfs -u
