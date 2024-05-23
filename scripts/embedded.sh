#!/bin/bash
#

sudo apt install arduino python3-serial ftdi-eeprom libcanberra-gtk-module libcanberra-gtk3-module -y

# Add user to dialout group
sudo usermod -aG dialout $USER

# Fix window management issues
sudo tee -a /etc/environment <<EOF
_JAVA_AWT_WM_NONREPARENTING=1
EOF

