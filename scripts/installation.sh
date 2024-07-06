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
}

# Function for compiler installation

programming() {
  echo "Select programming languages to install (separated by spaces, or '0' to skip): "
  echo "Options: 1. C++ 2. Python3 & Jupyter Notebook 3. Java 4. None"

  read -r -a languages

  for language_index in "${languages[@]}"; do
    case $language_index in
    1)
      echo "** Installing C++ and its essentials...**"
      sudo apt install gcc g++ gdb -y
      echo "C++ installed successfully."
      ;;
    2)
      echo "** Installing Python3 and Jupyter Notebook and its libraries...**"
      sudo apt install python3 python3-pygame python3-sklearn python3-pandas python3-numpy python3-seaborn jupyter-notebook -y
      echo "Python3 and Jupyter Notebook installed successfully."
      ;;
    3)
      echo "** Installing Java... **"
      sudo apt install openjdk-17-jdk openjdk-17-jre -y
      echo "** Installed OpenJDK 17 successfully **"
      ;;
    4)
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
}

desktopEnvInstallation() {
  echo "Select Desktop Environments (DEs) to install (separated by spaces, or '0' to skip):"
  echo "Options: 1. Gnome 2. KDE 3. None"

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
}

windowManagerInstallation() {
  echo "Select Window Managers (WMs) to install (separated by spaces, or '0' to skip):"
  echo "Options: 1. i3 2. Sway 3. None"

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
}

Apps() {
  ./apps/browser.sh
  ./apps/compilerInstallation.sh
  ./apps/videoPlayer.sh
  ./apps/gromit-mpx.sh
  ./apps/obsidian.sh
}

#------------------ Calling All Methods at the end of the script -----------------#

essentials
programming
desktopEnvInstallation
windowManagerInstallation
Apps
