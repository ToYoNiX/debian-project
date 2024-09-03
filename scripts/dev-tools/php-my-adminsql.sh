#!/bin/bash

# Check if wget is available, install it if not
if ! command -v wget &>/dev/null; then
    echo "wget command not found. Installing wget..."
    sudo apt update && sudo apt install wget -y
    if [ $? -ne 0 ]; then
        echo "Failed to install wget. Exiting."
        exit 1
    fi
fi

# Check if apache2 is available, install it if not
if ! command -v apache2 &>/dev/null; then
    echo "apache2 command not found. Installing apache2..."
    sudo apt install apache2 -y
    if [ $? -ne 0 ]; then
        echo "Failed to install apache2. Exiting."
        exit 1
    fi
fi

# Install PHP and dependencies
phpVar="php php-cgi php-mysqli php-pear php-mbstring libapache2-mod-php php-common php-phpseclib php-mysql"
echo "Installing PHP and its dependencies..."
sudo apt install $phpVar -y
if [ $? -ne 0 ]; then
    echo "Failed to install PHP. Exiting."
    exit 1
fi

# Ensure the Downloads directory exists
mkdir -p ~/Downloads

echo "Downloading phpMyAdmin..."
wget -P ~/Downloads https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz
if [ $? -ne 0 ]; then
    echo "Failed to download phpMyAdmin. Exiting."
    exit 1
fi

wget -P ~/Downloads https://files.phpmyadmin.net/phpmyadmin.keyring
if [ $? -ne 0 ]; then
    echo "Failed to download phpMyAdmin keyring. Exiting."
    exit 1
fi

cd ~/Downloads

gpg --import phpmyadmin.keyring
if [ $? -ne 0 ]; then
    echo "Failed to import keyring. Exiting."
    exit 1
fi

wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz.asc
if [ $? -ne 0 ]; then
    echo "Failed to download phpMyAdmin signature. Exiting."
    exit 1
fi

gpg --verify phpMyAdmin-latest-all-languages.tar.gz.asc
if [ $? -ne 0 ]; then
    echo "GPG verification failed. Exiting."
    exit 1
fi

# Unpack and Configure phpMyAdmin
echo "Unpacking and configuring phpMyAdmin..."
sudo mkdir -p /var/www/html/phpMyAdmin

sudo tar xvf phpMyAdmin-latest-all-languages.tar.gz --strip-components=1 -C /var/www/html/phpMyAdmin
if [ $? -ne 0 ]; then
    echo "Failed to unpack phpMyAdmin. Exiting."
    exit 1
fi

# Clean up downloaded files
rm ~/Downloads/phpMyAdmin-latest-all-languages.tar.gz*
rm ~/Downloads/phpmyadmin.keyring

# Set proper permissions
sudo chown -R www-data:www-data /var/www/html/phpMyAdmin

echo "phpMyAdmin installation completed."
