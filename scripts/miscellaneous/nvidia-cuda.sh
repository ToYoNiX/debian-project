#!/bin/bash
#

echo "Starting CUDA installation..."

# Define the packages to be installed
packages=(
    nvidia-cuda-dev
    nvidia-cuda-toolkit
    nvidia-cudnn
    python3-pip
    python3-dev
    python3-venv
    gcc
    g++
    make
)

# Function to install packages
installCudaPackages () {
    sudo apt update
    sudo apt install -y "${packages[@]}"
}

# Function to check if packages are installed
checkPackagesInstalled () {
    for package in "${packages[@]}"; do
        if ! dpkg -l | grep -q "$package"; then
            return 1
        fi
    done
    return 0
}

# Attempt to install CUDA packages up to 3 times
for (( attempt=1 ; attempt<=3 ; attempt++ )); do
    echo "Attempting to install CUDA packages - attempt number: $attempt"
    installCudaPackages

    if checkPackagesInstalled; then
        echo "CUDA and related packages installed successfully."
        exit 0
    else
        echo "Failed to install some CUDA packages. Retrying..."
    fi
done

# Final check to confirm installation
if checkPackagesInstalled; then
    echo "CUDA installation completed successfully after retries."
else
    echo "Failed to install CUDA packages after multiple attempts."
    exit 1
fi
