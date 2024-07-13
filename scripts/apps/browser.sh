#!/bin/bash

echo "Select browser(s) to install (separated by spaces, or '0' to skip):"
echo "Options:
  1. Chrome
  2. Brave 
  3. None"

read -r -a brs
for brs_index in "${brs[@]}"; do
  case $brs_index in
  1)
    echo "Installing Chrome"
    flatpak install -y flathub com.google.Chrome
    ;;
  2)
    echo "Installing Brave"
    flatpak install -y flathub com.brave.Browser
    ;;
  0)
    echo "Skipping browser installation"
    ;;
  *)
    echo "Invalid option: $brs_index"
    ;;
  esac
done
