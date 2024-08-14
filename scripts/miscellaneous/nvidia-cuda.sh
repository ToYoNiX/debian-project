#!/bin/bash
#

# Install Cuda Drivers
echo "Installing CUDA..."
sudo apt install nvidia-cuda-dev nvidia-cuda-toolkit nvidia-cudnn python3-pip python3-dev python3-venv gcc g++ make -y
echo "Installed CUDA successfully"
