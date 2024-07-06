#!/bin/bash
# Installing CLion

if ! command -v clion >/dev/null 2>&1; then
    echo "** Installing CLion...**"
    sudo snap install clion --classic
else
    echo "CLion is already installed."
fi