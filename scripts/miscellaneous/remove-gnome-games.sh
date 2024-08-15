#!/bin/bash
#

echo "Checking for unwanted games..."

# Define the unwanted games to be removed
unwanted_games=(
    iagno
    lightsoff
    "four-in-a-row"
    gnome-robots
    pegsolitaire
    gnome-2048
    hitori
    gnome-klotski
    gnome-mines
    gnome-mahjongg
    gnome-sudoku
    quadrapassel
    swell-foop
    gnome-tetravex
    gnome-taquin
    aisleriot
    gnome-chess
    "five-or-more"
    gnome-nibbles
    tali
)

# Function to check if any unwanted games are still installed
checkUnwantedGames () {
    for game in "${unwanted_games[@]}"; do
        if dpkg -l | grep -q "$game"; then
            return 1
        fi
    done
    return 0
}

# Function to remove unwanted games
removeGames () {
    sudo apt purge -y "${unwanted_games[@]}"
    sudo apt autoremove -y
}

# Attempt to remove unwanted games up to 3 times
for (( attempt=1 ; attempt<=3 ; attempt++ )); do
    echo "Attempt number $attempt: Removing unwanted games..."
    removeGames

    # Check if any unwanted games are still installed
    if checkUnwantedGames; then
        echo "All unwanted games have been successfully removed."
        exit 0
    else
        echo "Some unwanted games are still installed. Retrying..."
    fi
done

echo "Failed to remove all unwanted games after multiple attempts."
exit 1
