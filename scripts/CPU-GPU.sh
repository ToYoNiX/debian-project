#!/bin/bash

# Install drivers based on OS and detected hardware
install_drivers() {
  # Check for root privileges (needed for driver installation)
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

  # Update package lists (doesn't require root)
  sudo apt update

  # Install base packages for building modules
  sudo apt install -y dkms build-essential

  # Detect GPU brand (modify or expand as needed)
  gpu_brand=$(lspci | grep -i nvidia && echo "nvidia" || lspci | grep -i amd && echo "amd")

  # Install drivers based on brand
  if [[ $gpu_brand ]]; then
    if [[ $gpu_brand == "nvidia" ]]; then
      # Install nvidia driver
      sudo apt install nvidia-driver

      # Update Grub config (recommended way)
      sudo update-grub

      # Prompt for CUDA installation
      read -p "Do you want to install CUDA drivers? (y/N): " cuda_install
      if [[ $cuda_install == "y" || $cuda_install == "Y" ]]; then
        # Install CUDA drivers (add specific packages as needed)
        sudo apt install nvidia-cuda-dev nvidia-cuda-toolkit nvidia-cudnn python3-pip python3-dev python3-venv gcc g++ make -y
      fi

      # For gnome (consider alternative approach if needed)
      sudo ln -s /dev/null /etc/udev/rules.d/61-gdm.rules
    elif [[ $gpu_brand == "amd" ]]; then
      sudo apt install -y xserver-xorg-video-radeon
    fi
  else
    echo "No dedicated GPU detected. CPU drivers likely handled by the kernel."
  fi
}

# Function to detect hardware can be added here (e.g., using lspci)

# Call the install function
install_drivers
