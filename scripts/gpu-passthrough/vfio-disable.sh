#!/bin/bash
#

sudo tee /etc/default/grub.d/nvidia-modeset.cfg <<EOF
GRUB_CMDLINE_LINUX="\$GRUB_CMDLINE_LINUX nvidia-drm.modeset=1"
EOF
sudo update-grub

sudo rm /etc/modprobe.d/blacklist.conf
sudo rm /etc/modprobe.d/vfio.conf

sudo update-initramfs -u
sudo apt install nvidia-driver -y
