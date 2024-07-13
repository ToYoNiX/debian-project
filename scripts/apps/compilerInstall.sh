#!/bin/bash

compilerInstallation() {
    echo "Select compilers to install (separated by spaces, or '0' to skip): "
    echo "Options:
    1. Visual Studio Code
    2. CLion
    3. PyCharm
    0. None"

    read -r -a compilers

    for compiler_index in "${compilers[@]}"; do
        case $compiler_index in
        1)
            # Install Visual Studio Code
            echo "** Installing Visual Studio Code... **"
            flatpak install -y flathub com.visualstudio.code
            echo "Visual Studio Code installed successfully."
            ;;
        2)
            # Install CLion
            echo "** Installing CLion... **"
            flatpak install -y flathub com.jetbrains.CLion
            echo "CLion installed successfully."
            ;;
        3)
            # Install PyCharm
            echo "** Installing PyCharm... **"
            flatpak install -y flathub com.jetbrains.PyCharm-Community
            echo "PyCharm installed successfully."
            ;;
        0)
            echo "Skipping compiler installation."
            return
            ;;
        *)
            echo "Invalid compiler selection: $compiler_index"
            ;;
        esac
    done
}

echo "-------------------------------------"
compilerInstallation
