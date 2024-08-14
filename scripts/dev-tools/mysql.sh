#!/bin/bash

# Update package lists
sudo apt update

# Install libaio bec its needed
sudo apt-get install libaio1

sudo apt install mariadb-server mariadb-client -y

sudo apt update

# Secure MySQL installation (prompts for password)
sudo mysql_secure_installation

echo "MySQL installation complete!"
