#!/bin/bash

# Check if wget command is available, install it if not
if ! command -v wget &>/dev/null; then
    echo "wget command not found. Installing wget..."
    sudo apt install wget -y
fi

# Check if apache2 command is available, install it if not
if ! command -v apache2 &>/dev/null; then
    echo "apache2 command not found. Installing apache2..."
    sudo apt install apache2 -y
fi

# Install php and its dependencies
phpVar="php php-cgi php-mysqli php-pear php-mbstring libapache2-mod-php php-common php-phpseclib php-mysql"
echo "Installing PHP and its dependencies..."
sudo apt install $phpVar -y

echo "Downloading phpMyAdmin..."
wget -P Downloads https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz

wget -P Downloads https://files.phpmyadmin.net/phpmyadmin.keyring

cd Downloads

gpg --import phpmyadmin.keyring

wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz.asc

gpg --verify phpMyAdmin-latest-all-languages.tar.gz.asc

# Unpack and Configure phpMyAdmin
echo "Unpacking and configuring phpMyAdmin..."
sudo mkdir /var/www/html/phpMyAdmin

sudo tar xvf phpMyAdmin-latest-all-languages.tar.gz --strip-components=1 -C /var/www/html/phpMyAdmin

echo "phpMyAdmin installation completed."
