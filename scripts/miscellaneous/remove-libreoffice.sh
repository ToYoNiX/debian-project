#!/bin/bash
#

# Check if LibreOffice is already removed
if ! dpkg -l | grep -q libreoffice; then
    echo "LibreOffice is already removed."
    exit 0
fi

removeLibreOffice () {
    sudo apt purge libreoffice-* -y
    sudo apt autoremove -y
}

# Attempt to remove LibreOffice up to 3 times
for (( attempt=1 ; attempt<=3 ; attempt++ )); do
    echo "Removing LibreOffice - attempt number:" $attempt
    removeLibreOffice

    # Check if LibreOffice is still installed
    if ! dpkg -l | grep -q libreoffice; then
        break
    fi
done

# Final check to confirm removal
if ! dpkg -l | grep -q libreoffice; then
    echo "LibreOffice has been successfully removed."
else
    echo "Something went wrong. -> LibreOffice."
    exit 1
fi
