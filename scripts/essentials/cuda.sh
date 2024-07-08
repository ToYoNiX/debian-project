#!/bin/bash
#

# Install Cuda Drivers
echo "Do you want to link with CUDA? (y/n)"
read -r link_cuda

if [[ $link_cuda == "y" || $link_cuda == "Y" ]]; then
    echo "Installing CUDA..."
    sudo apt install nvidia-cuda-dev nvidia-cuda-toolkit nvidia-cudnn python3-pip python3-dev python3-venv gcc g++ make -y
    echo "Installed CUDA successfully"
else
    echo "Skipping CUDA linking."
fi
