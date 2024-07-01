#/!bin/bash

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
  echo "Please select the web browser you want to install (or 'None' to skip): "

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
  local compiler_name="$1"

  case $compiler_name in
  "vscode")
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
  "clion")
    # Install clion (replace with actual commands)
    echo "** Installing CLion...**"
    sudo snap install clion --classic
    ;;
  "pycharm")
    # Install pycharm (replace with actual commands)
    echo "** Installing PyCharm...**"
    sudo snap install pycharm-community --classic
    ;;
  *)
    echo "Invalid compiler selection: $compiler_name"
    ;;
  esac
  # Offer compiler selection
  echo "Select a compiler to install (or 'None' to skip): "

  compiler_option=("None" "vscode" "clion" "pycharm")

  select compiler in "${compiler_option[@]}"; do
    case $compiler in
    "None")
      echo "Skipping compiler installation."
      break
      ;;
    *)
      compilerInstallation "$compiler"
      break
      ;;
    esac
  done
}

videoPlayer() {
  echo "Please select the video player you want to install (or 'None' to skip): "
  video_option=("None" "VLC" "MPV")

  select video in "${video_option[@]}"; do
    case $video in
    "VLC")
      echo "** Installing VLC media player...**"
      flatpak install flathub org.videolan.VLC
      echo "VLC installed successfully."
      break
      ;;
    "MPV")
      echo "** Installing MPV media player...**"
      sudo apt install mpv -y
      echo "MPV installed successfully."
      break
      ;;
    "None")
      echo "Skipping video player installation."
      break
      ;;
    *)
      echo "Invalid selection."
      ;;
    esac
  done
}

#------------------ Calling All Methods at the end of the script -----------------#

essentials
browserInstallation
compilerInstallation
videoPlayer
