#!/bin/bash
#

echo "Adding 32-bit architecture support..."
sudo dpkg --add-architecture i386

# Install basic Steam and related packages
sudo apt install steam-installer steam-devices mesa-vulkan-drivers libglx-mesa0:i386 mesa-vulkan-drivers:i386 libgl1-mesa-dri:i386 protontricks mangohud goverlay vkbasalt gamemode -y

# Check if NVIDIA drivers are installed
if command -v nvidia-smi &> /dev/null ; then
    echo "NVIDIA drivers detected. Installing NVIDIA 32-bit libraries..."
    sudo apt install nvidia-driver-libs:i386 -y
else
    echo "NVIDIA drivers not detected. Skipping NVIDIA 32-bit libraries installation."
fi