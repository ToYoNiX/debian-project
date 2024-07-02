#!/bin/bash

# Install drivers based on detected hardware
install_drivers() {
  # Check for root privileges (needed for driver installation)
  if [[ $EUID -ne 0 ]]; then
    echo "This script requires root privileges. Please run with sudo."
    exit 1
  fi

  # Update package lists
  sudo apt update

  # Install base packages for building modules
  sudo apt install -y dkms build-essential

  # Detect GPU brands
  nvidia_detected=$(lspci | grep -iq nvidia && echo "yes")
  amd_detected=$(lspci | grep -iq amd && echo "yes")

  # Install NVIDIA driver if NVIDIA GPU is detected
  if [[ $nvidia_detected == "yes" ]]; then
    sudo apt install -y nvidia-driver

    # Update Grub config
    sudo update-grub

    # Prompt for CUDA installation
    read -p "Do you want to install CUDA drivers? (y/N): " cuda_install
    if [[ $cuda_install == "y" || $cuda_install == "Y" ]]; then
      # Install CUDA drivers
      sudo apt install -y nvidia-cuda-dev nvidia-cuda-toolkit nvidia-cudnn python3-pip python3-dev python3-venv gcc g++ make
    fi

    # For GNOME (consider alternative approach if needed)
    sudo ln -s /dev/null /etc/udev/rules.d/61-gdm.rules
  fi

  # Install AMD driver if AMD GPU is detected
  if [[ $amd_detected == "yes" ]]; then
    sudo apt install -y xserver-xorg-video-radeon
  fi

  if [[ $nvidia_detected != "yes" && $amd_detected != "yes" ]]; then
    echo "No dedicated GPU detected. CPU drivers are likely handled by the kernel."
  fi
}

# Call the install function
install_drivers
