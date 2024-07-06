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

browserInstallation() {
  echo "Select the web browsers you want to install (separated by spaces, or '0' to skip): "

  browser_option=("Chrome" "Brave" "None")
  chrome_selected=false
  brave_selected=false

  select web in "${browser_option[@]}"; do
    case $web in
    "Chrome")
      chrome_selected=true
      ;;
    "Brave")
      brave_selected=true
      ;;
    "None")
      echo "Skipping web browser installation."
      return
      ;;
    *)
      echo "Invalid selection."
      continue
      ;;
    esac
  done

  # Install selected browsers if not already installed
  if [ "$chrome_selected" = true ]; then
    ./apps/google-chrome.sh
  fi

  if [ "$brave_selected" = true ]; then
    ./apps/brave-browser.sh
  fi
}

# Function for compiler installation
compilerInstallation() {
  echo "Select compilers to install (separated by spaces, or '0' to skip): "
  echo "Options: 1. vscode 2. clion 3. pycharm 4. None"

  read -r -a compilers

  for compiler_index in "${compilers[@]}"; do
    case $compiler_index in
    1)
      # Install vscode
      ./apps/vscode.sh
      ;;
    2)
      # Install clion
      ./apps/clion.sh
      ;;
    3)
      # Install pycharm
      ./apps/pycharm.sh
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

videoPlayer() {
  echo "Select video players to install (separated by spaces, or '0' to skip): "
  echo "Options: 1. VLC 2. MPV 3. None"

  read -r -a videos

  for video_index in "${videos[@]}"; do
    case $video_index in
    1)
      echo "** Installing VLC media player...**"
      flatpak install flathub org.videolan.VLC
      echo "VLC installed successfully."
      ;;
    2)
      echo "** Installing MPV media player...**"
      sudo apt install mpv -y
      echo "MPV installed successfully."
      ;;
    3)
      echo "Skipping video player installation."
      return
      ;;
    0)
      echo "Skipping video player installation."
      return
      ;;
    *)
      echo "Invalid video player selection: $video_index"
      ;;
    esac
  done
}

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
  browserInstallation
  videoPlayer
  grommitInstallation
}

grommitInstallation() {
  echo "Do you want to install Grommit-mpx?"
  echo "Grommit-mpx is an app that allows you to write on the screen. (y/n)"
  read -r install_grommit
  ./apps/gromit-mpx.sh
}

grommitInstallation

#------------------ Calling All Methods at the end of the script -----------------#

essentials
Apps
compilerInstallation
programming
desktopEnvInstallation
windowManagerInstallation
