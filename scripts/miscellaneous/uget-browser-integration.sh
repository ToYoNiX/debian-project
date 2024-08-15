#!/bin/bash
#

echo "Starting the installation of uGet Integrator..."

# Download the uGet Integrator installation script
wget -q https://raw.githubusercontent.com/ugetdm/uget-integrator/master/install/linux/install_uget_integrator.sh -O /tmp/install_uget_integrator.sh

# Check if the download was successful
if [ -f /tmp/install_uget_integrator.sh ]; then
    echo "Downloaded uGet Integrator installation script successfully."

    # Make the script executable
    chmod +x /tmp/install_uget_integrator.sh

    # Run the installation script
    echo "Running the uGet Integrator installation script..."
    /tmp/install_uget_integrator.sh

    # Clean up by removing the installation script
    rm /tmp/install_uget_integrator.sh
    echo "Installation script removed after execution."

    echo "uGet Integrator installed successfully."
else
    echo "Failed to download the uGet Integrator installation script."
    exit 1
fi
