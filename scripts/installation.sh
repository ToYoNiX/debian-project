#!/bin/bash

essentials() {
  # Check if flatpak is installed
  if ! command -v flatpak >/dev/null 2>&1; then
    echo "Flatpak is not installed. Installing flatpak..."
    sudo apt install flatpak -y
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
  else
    echo "Flatpak is already installed."
  fi

  # Check if snapd is installed
  if ! command -v snap >/dev/null 2>&1; then
    echo "Snapd is not installed. Installing snapd..."
    sudo apt install snapd -y
    sudo snap install core
  else
    echo "Snapd is already installed."
  fi
  echo "
  -------------------------------------
  
  -------------------------------------
  "
}

# Function for compiler installation

programming() {
  echo "Select programming languages to install (separated by spaces, or '0' to skip): "
  echo "Options: 
  1. C++
  2. Python3 & Jupyter Notebook
  3. Java
  4. C# and dotnet SDK
  5. None"

  read -r -a languages

  for language_index in "${languages[@]}"; do
    case $language_index in
    1)
      ./programming/cpp.sh
      ;;
    2)
      ./programming/data-science.sh
      ;;
    3)
      ./programming/java.sh
      ;;
    4)
      ./programming/csharp.sh
      return
      ;;
    5)
      ./programming/mysql.sh
      return
      ;;
    6)
      echo "Skipping programming language installation."
      return
      ;;
    0)
      echo "Skipping programming language installation."
      return
      ;;
    *)
      echo "Invalid selection: $language_index"
      ;;
    esac
  done

  echo "
  -------------------------------------
  
  -------------------------------------
  "
}

gamingInstallation() {
  echo "Do you want to install gaming essentials? (y/n)"
  read -r install_gaming

  if [[ $install_gaming == "y" || $install_gaming == "Y" ]]; then
    echo "Installing gaming essentials..."

    ./apps/steam.sh
    flatpak install flathub org.winehq.wine -y
    flatpak install flathub org.lutris.Lutris -y
    echo "Gaming essentials installed successfully."
  else
    echo "Skipping gaming essentials installation."
  fi
  ./essentials/nvidia.sh
  ./essentials/cuda.sh
  echo "
  -------------------------------------
  
  -------------------------------------
  "
}

desktopEnvInstallation() {
  echo "Select Desktop Environments (DEs) to install (separated by spaces, or '0' to skip):"
  echo "Options: 
  1. Gnome 
  2. KDE 
  3. None"

  read -r -a des

  for de_index in "${des[@]}"; do
    case $de_index in
    1)
      if ! command -v gnome-shell >/dev/null 2>&1; then
        echo "** Installing Gnome..."
        sudo apt install gnome-shell gnome-core gnome-terminal -y
        echo "Gnome installed successfully."
      else
        echo "Gnome is already installed."
      fi
      ;;
    2)
      if ! command -v plasmashell >/dev/null 2>&1; then
        echo "** Installing KDE..."
        sudo apt install plasma-desktop kde-applications-default kde-connect -y
        echo "KDE installed successfully."
      else
        echo "KDE is already installed."
      fi
      ;;
    3)
      echo "Skipping Desktop Environment installation."
      return
      ;;
    0)
      echo "Skipping Desktop Environment installation."
      return
      ;;
    *)
      echo "Invalid selection: $de_index"
      ;;
    esac
  done
  echo "
  -------------------------------------
  
  -------------------------------------
  "
}

windowManagerInstallation() {

  echo "Select Window Managers (WMs) to install (separated by spaces, or '0' to skip):"
  echo "Options: 
  1. i3 
  2. Sway 
  3. None"

  read -r -a wms

  for wm_index in "${wms[@]}"; do
    case $wm_index in
    1)
      ./wm/i3.sh
      ;;
    2)
      ./wm/sway.sh
      ;;
    3)
      echo "Skipping Window Manager installation."
      return
      ;;
    0)
      echo "Skipping Window Manager installation."
      return
      ;;
    *)
      echo "Invalid selection: $wm_index"
      ;;
    esac
  done
  echo "
  -------------------------------------
  
  -------------------------------------
  "
}

Apps() {
  ./apps/browser.sh
  ./apps/compilerInstall.sh
  ./apps/videoPlayer.sh
  ./apps/obsidian.sh
  ./apps/gromit-mpx.sh
}

#------------------ Calling All Methods at the end of the script -----------------#

essentials
programming
desktopEnvInstallation
windowManagerInstallation
gamingInstallation
Apps

echo "Installation complete."
echo "Is better to restart your system now. Do you want to restart now? (y/n)"
read -r restart
if [[ $restart == "y" || $restart == "Y" ]]; then
  sudo reboot
else
  echo "
  
  You can restart your system later."
fi
#------------------ End of the script -----------------#
