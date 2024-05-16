#!/bin/bash
#

sudo apt install arduino python3-serial ftdi-eeprom libcanberra-gtk-module libcanberra-gtk3-module -y

# Add user to dialout group
sudo usermod -aG dialout $USER

