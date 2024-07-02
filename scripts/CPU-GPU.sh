#!/bin/bash

# Function to detect GPU and CPU type
detect_hardware() {
  if [[ $(lspci | grep -i nvidia) ]]; then
    echo "Detected Nvidia GPU"
    gpu_brand="nvidia"
  elif [[ $(lspci | grep -i amd) && $(lspci | grep -i vga) ]]; then
    echo "Detected AMD GPU"
    gpu_brand="amd"
  else
    echo "No dedicated GPU detected, using CPU"
  fi
  cpu_info=$(lscpu | grep -m1 "Model name:")
  cpu_model=${cpu_info#*:}
  echo "CPU Model: $cpu_model"
}

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
      # Use official NVIDIA repositories for best results (requires internet access)
      # You may need to add the appropriate PPA based on your Ubuntu version
      # See https://www.nvidia.com/en-us/drivers/unix/ for details
      # Uncomment the following lines if desired
      # sudo add-apt-repository ppa:ubuntu-drivers/nvidia
      # sudo apt update

      # Otherwise, use the default repository drivers
      sudo apt install -y nvidia-driver
    elif [[ $gpu_brand == "amd" ]]; then
      sudo apt install -y xserver-xorg-video-amdhd
    fi
  fi

  # No dedicated GPU, so assume CPU drivers are handled by the kernel
  echo "CPU drivers likely handled by the kernel."
}
