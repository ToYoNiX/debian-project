#!/bin/bash

echo "Xournal++ is a hand note-taking software written in C++ with the target of flexibility"
echo "Do you want to install Xournal++? (y/n)"

read -r install_xournal

if [[ $install_xournal == "y" || $install_xournal == "Y" ]]; then
    echo "--------------------"
    echo "Installing xournal, please wait .."
    sudo flatpak -y install flathub com.github.xournalpp.xournalpp
else
    echo "Skipping discord installation."
    echo "---------------------"
fi
