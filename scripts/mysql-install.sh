#!/bin/bash

# Update package lists
sudo apt update

# Install libaio bec its needed
sudo apt-get install libaio1
  
# Add the official MySQL repository for Debian 12 (replace 'mysql-apt-config_0.8.26-1_all.deb' with the latest version if needed)
curl -sSL https://dev.mysql.com/get/mysql-apt-config_0.8.26-1_all.deb | sudo apt install -

sudo apt update

# Install MySQL server package
sudo apt install mysql-server

# Secure MySQL installation (prompts for password)
sudo mysql_secure_installation

echo "MySQL installation complete!"
