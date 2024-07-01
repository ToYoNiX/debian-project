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
  echo "Please select the web browser you want to install (or '0' to skip): "

  browser_option=("None" "Chrome" "Brave" "Floorp" "Thorium")

  select web in "${browser_option[@]}"; do
    case $web in
    "Chrome")
      web_install="chrome"
      break
      ;;
    "Brave")
      web_install="brave"
      break
      ;;
    "Floorp")
      web_install="floorp"
      # Install Floorp-browser
      nala install apt-transport-https curl -y
      curl -fsSL https://ppa.ablaze.one/KEY.gpg | gpg --dearmor -o /usr/share/keyrings/Floorp.gpg
      curl -sS --compressed -o /etc/apt/sources.list.d/Floorp.list 'https://ppa.ablaze.one/Floorp.list'
      nala update
      nala install floorp -y
      break
      ;;
    "Thorium")
      web_install="thorium"
      # Install Thorium-browser
      builddir="/tmp/thorium_build" # Change this if you prefer a different temporary directory
      mkdir -p "$builddir"          # Create the temporary directory if it doesn't exist
      cd "$builddir"
      nala install apt-transport-https curl -y
      wget -O ./deb-packages/thorium-browser.deb "$(curl -s https://api.github.com/repos/Alex313031/Thorium/releases/latest | grep browser_download_url | grep amd64.deb | cut -d '"' -f 4)"
      nala install ./deb-packages/thorium-browser.deb -y
      cd -               # Exit the temporary directory
      rm -rf "$builddir" # Optionally remove the temporary directory after installation (comment out if you want to keep it)
      break
      ;;
    "None")
      echo "Skipping web browser installation."
      exit 0
      ;;
    *)
      echo "Invalid selection."
      ;;
    esac
  done

  # Now you have $web_install set to the chosen browser (or empty if "None")

  # Placeholder comments for Chrome and Brave installation (replace with actual commands)
  if [ "$web_install" = "chrome" ]; then
    echo "** Installing Google Chrome...**"
    sudo apt install wget -y
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo apt install ./google-chrome-stable_current_amd64.deb -y
    rm google-chrome-stable_current_amd64.deb
  elif [ "$web_install" = "brave" ]; then
    echo "** Installing Brave... **"
    sudo snap install brave
    echo "Brave browser installed successfully."
  fi
}

# Function for compiler installation
compilerInstallation() {
  echo "Select compilers to install (separated by spaces, or '0' to skip): "
  echo "Options: 1. vscode 2. clion 3. pycharm"
  read -r -a compilers

  for compiler_index in "${compilers[@]}"; do
    case $compiler_index in
    1)
      # Install vscode
      echo "** Installing Visual Studio Code..**"
      sudo apt-get install wget gpg
      wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg
      sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
      echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list >/dev/null
      rm -f packages.microsoft.gpg

      sudo apt install apt-transport-https
      sudo apt update
      sudo apt install code -y
      ;;
    2)
      # Install clion
      echo "** Installing CLion...**"
      sudo snap install clion --classic
      ;;
    3)
      # Install pycharm
      echo "** Installing PyCharm...**"
      sudo snap install pycharm-community --classic
      ;;
    0)
      echo "Skipping compiler installation."
      ;;
    *)
      echo "Invalid compiler selection: $compiler_index"
      ;;
    esac
  done
}

videoPlayer() {
  echo "Select video players to install (separated by spaces, or '0' to skip): "
  echo "Options: 1. VLC 2. MPV"
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
    0)
      echo "Skipping video player installation."
      ;;
    *)
      echo "Invalid video player selection: $video_index"
      ;;
    esac
  done
}

programming() {
  echo "Select programming languages to install (separated by spaces, or '0' to skip): "
  echo "Options: 1. C++ 2. Python3 & Jupyter Notebook 3. Java"
  read -r -a languages

  for language_index in "${languages[@]}"; do
    case $language_index in
    1)
      echo "** Installing C++ and its essentials...**"
      sudo apt install gcc g++ gdb -y
      echo "C++ installed successfully."
      ;;
    2)
      echo "** Installing Python3 and Jupyter Notebook and it's librarries...**"
      sudo apt install python3 python3-pygame python3-sklearn python3-pandas python3-numpy python3-seaborn jupyter-notebook -y
      echo "Installed Successfully"

      ;;
    3)
      echo "** Installing Java... **"
      sudo apt install openjdk-17-jdk openjdk-17-jre -y
      echo "** Installed OpenJDK 17 successfully **"
      ;;
    0)
      echo "Skipping programming language installation."
      ;;
    *)
      echo "Invalid selection: $language_index"
      ;;
    esac
  done
}

tools(){}
drivers(){}
gaming(){}

#------------------ Calling All Methods at the end of the script -----------------#

essentials
browserInstallation
videoPlayer
compilerInstallation
programming
