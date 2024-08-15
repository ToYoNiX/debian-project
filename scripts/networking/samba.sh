#!/bin/bash
#

echo "Installing and configuring Samba..."

# Define the package name
package="samba"

# Attempt to install Samba up to 3 times
for (( attempt=1 ; attempt<=3 ; attempt++ )); do
    echo "Attempt number $attempt: Installing $package..."
    sudo apt update
    sudo apt install -y "$package"

    # Check if Samba was installed successfully
    if dpkg -l | grep -q "$package"; then
        echo "$package installed successfully."
        break
    else
        echo "Failed to install $package. Retrying..."
    fi
done

# Check if Samba was installed successfully
if ! dpkg -l | grep -q "$package"; then
    echo "Failed to install $package after multiple attempts."
    exit 1
fi

# Configure Samba
config_file="/etc/samba/smb.conf"
echo "Configuring Samba..."

# Backup existing smb.conf if it exists
if [ -f "$config_file" ]; then
    sudo cp "$config_file" "${config_file}.bak"
fi

# Write new Samba configuration
sudo tee "$config_file" > /dev/null <<EOF
[share]
   path = /home/$USER/
   browseable = yes
   read only = no
   writable = yes
EOF

# Restart Samba service
echo "Restarting Samba service..."
sudo systemctl restart smbd

# Set Samba password for the user
echo "Setting Samba password for $USER..."
sudo smbpasswd -a "$USER"

echo "Samba installation and configuration completed successfully."
