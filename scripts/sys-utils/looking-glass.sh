#!/bin/bash
#

# Install required dependencies
sudo apt-get install git binutils-dev cmake fonts-dejavu-core libfontconfig-dev \
    gcc g++ pkg-config libegl-dev libgl-dev libgles-dev libspice-protocol-dev \
    nettle-dev libx11-dev libxcursor-dev libxi-dev libxinerama-dev \
    libxpresent-dev libxss-dev libxkbcommon-dev libwayland-dev wayland-protocols \
    libpipewire-0.3-dev libpulse-dev libsamplerate0-dev -y

# Git and build looking glass
git clone --recursive https://github.com/gnif/LookingGlass.git
cd LookingGlass/
mkdir client/build
cd client/build
cmake ../
make
sudo make install

# Remove the repo folder
cd ../../../
sudo rm -r LookingGlass/

# Create permissions for the user
sudo tee /etc/tmpfiles.d/10-looking-glass.conf <<EOF
# Type Path               Mode UID   GID Age Argument

f /dev/shm/looking-glass  0660 $USER kvm -
EOF

