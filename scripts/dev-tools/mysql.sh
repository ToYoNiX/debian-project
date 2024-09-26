#!/bin/bash

mysql() {
    # Pull the latest MySQL image
    docker pull mysql

    # Prompt for the container name
    echo "Please enter the name you want to assign to your container:"
    read name

    # Prompt for the MySQL root password
    echo "Please enter the password to be set for the MySQL root user:"
    read -s password # The '-s' flag hides the input for security

    # Run the MySQL container
    docker run --name "$name" -e MYSQL_ROOT_PASSWORD="$password" -d mysql:8
    echo "MySQL container '$name' is now running."
}

# Check if Docker is installed
if command -v docker &>/dev/null; then
    mysql
else
    echo "Docker is not installed."
    echo "You need to Install Docker First. Install ? Y | N"
    read input
    if [[ $input == "Y" || $input == "y" ]]; then
        # Call the script to install Docker
        chmod +x ./sys-utils/docker-install.sh
        ./sys-utils/docker-install.sh
        mysql
    else
        echo "Docker installation skipped."
    fi
fi
