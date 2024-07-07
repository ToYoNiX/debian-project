#!/bin/bash
#

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
        echo "** Installing Google Chrome...**"
        flatpak install flathub com.google.Chrome
        echo "Google Chrome installed successfully."
    fi

    if [ "$brave_selected" = true ]; then
        echo "** Installing Brave Browser...**"
        flatpak install flathub com.brave.Browser
        echo "Brave Browser installed successfully."
    fi
}

browserInstallation
