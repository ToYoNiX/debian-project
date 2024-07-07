#!/bin/bash
#

compilerInstallation() {
    echo "Select compilers to install (separated by spaces, or '0' to skip): "
    echo "Options:
    1. vscode 
    2. clion 
    3. pycharm 
    4. None"

    read -r -a compilers

    for compiler_index in "${compilers[@]}"; do
        case $compiler_index in
        1)
            # Install vscode
            echo "** Installing Visual Studio Code...**"
            flatpak install flathub com.visualstudio.code
            echo "Visual Studio Code installed successfully."
            ;;
        2)
            # Install clion
            echo "** Installing CLion...**"
            flatpak install flathub com.jetbrains.CLion
            echo "CLion installed successfully."
            ;;
        3)
            # Install pycharm
            echo "** Installing PyCharm...**"
            flatpak install flathub com.jetbrains.PyCharm-Community
            echo "PyCharm installed successfully."
            ;;
        4)
            echo "Skipping compiler installation."
            return
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
