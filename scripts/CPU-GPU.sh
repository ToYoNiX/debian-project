#!/bin/bash

# Install drivers based on OS and detected hardware
install_drivers() {
  # Check for root privileges
  if [[ $EUID -ne 0 ]]; then
    echo "This script requires root privileges. Please run with sudo."
    exit 1
  fi

  # Detect OS type (limited to Ubuntu/Debian and derivatives for now)
  os_name=$(lsb_release -cs 2>/dev/null)
  if [ -z "$os_name" ]; then
    echo "Unsupported Linux distribution. Script only supports Ubuntu/Debian based systems."
    exit 1
  fi

  if [[ $gpu_brand ]]; then
    # Update package lists
    sudo apt update

    # Install base packages for building modules
    sudo apt install -y dkms build-essential

    # Install nvidia or amd drivers based on brand
    if [[ $gpu_brand == "nvidia" ]]; then
      # Install the nvidia
      sudo apt install nvidia-driver

      # Add nvidia drm to grub
      sudo tee /etc/default/grub.d/nvidia-modeset.cfg <<EOF
GRUB_CMDLINE_LINUX="\$GRUB_CMDLINE_LINUX nvidia-drm.modeset=1"
EOF
      sudo update-grub

      #Install cuda drivers?
      sudo apt install nvidia-cuda-dev nvidia-cuda-toolkit nvidia-cudnn python3-pip python3-dev python3-venv gcc g++ make -y

      # For gnome
      sudo ln -s /dev/null /etc/udev/rules.d/61-gdm.rules
    elif [[ $gpu_brand == "amd" ]]; then
      sudo apt install -y xserver-xorg-video-radeon
    fi
  fi

  # No dedicated GPU, so assume CPU drivers are handled by the kernel
  echo "CPU drivers likely handled by the kernel."
}

detect_hardware
install_drivers
