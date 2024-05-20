#!/bin/bash
#

sudo apt purge firefox-esr gnome-music gnome-video-effects totem* rhythmbox* shotwell* libreoffice-* gnome-system-monitor -y
sudo apt autoremove -y

sudo apt install vim obs-studio uget vlc papirus-icon-theme bibata-cursor-theme kdeconnect gnome-shell-extension-gsconnect -y
