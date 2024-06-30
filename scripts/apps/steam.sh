#!/bin/bash
#

sudo dpkg --add-architecture i386
sudo apt update
sudo apt install steam-installer steam-devices mesa-vulkan-drivers libglx-mesa0:i386 mesa-vulkan-drivers:i386 libgl1-mesa-dri:i386 nvidia-driver-libs:i386 protontricks mangohud goverlay vkbasalt -y
