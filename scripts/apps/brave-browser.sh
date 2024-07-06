if ! command -v brave >/dev/null 2>&1; then
    echo "** Installing Brave... **"
    sudo snap install brave
    echo "Brave browser installed successfully."
else
    echo "Brave browser is already installed."
fi
