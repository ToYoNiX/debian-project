# Check if gnome-shell-extension-manager is already installed
if dpkg -l | grep -q gnome-shell-extension-manager; then
  echo "Gnome Shell Extension Manager is already installed."
else
  echo "Installing Gnome Shell Extension Manager..."
  sudo apt install gnome-shell-extension-manager -y
  if [[ $? -eq 0 ]]; then
    echo "Gnome Shell Extension Manager installed successfully."
  else
    echo "Failed to install Gnome Shell Extension Manager."
    exit 1
  fi
fi
