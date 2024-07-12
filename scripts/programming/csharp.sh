#!/bin/bash
#

read -p "Do you want to install C# and dotnet-sdk-8.0 package? (y/n): " answer
if [[ $answer == "y" || $answer == "Y" ]]; then
    echo "Installing C# and Dotnet .."
    wget https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
    sudo dpkg -i packages-microsoft-prod.deb
    rm packages-microsoft-prod.deb

    sudo apt-get update &&
        sudo apt-get install -y dotnet-sdk-8.0 &&
        sudo apt-get install -y mono-complete
fi
