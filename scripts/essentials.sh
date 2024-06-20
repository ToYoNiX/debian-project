#!/bin/bash
#

sudo apt install vim curl gparted obs-studio uget mpv yt-dlp papirus-icon-theme bibata-cursor-theme kdeconnect gnome-shell-extension-gsconnect -y

sudo apt purge firefox-esr gnome-music gnome-video-effects totem* rhythmbox* shotwell* libreoffice-* gnome-system-monitor vlc -y
sudo apt autoremove -y
