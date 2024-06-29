#!/bin/bash
#

# Install required apps
sudo apt install qemu-system-x86 libvirt-clients libvirt-daemon-system libvirt-daemon-config-network bridge-utils virt-manager ovmf -y

# Adding user to the libvirt group
sudo usermod -a -G kvm,libvirt $(whoami)

# Enable the service
sudo systemctl enable libvirtd
sudo systemctl start libvirtd
sudo systemctl restart libvirtd

# Enabling the virtual machine default network
sudo virsh net-autostart default
sudo virsh net-start default

