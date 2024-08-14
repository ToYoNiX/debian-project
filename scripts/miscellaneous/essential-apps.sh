#!/bin/bash
#

sudo apt install vim curl wget tree uget gparted obs-studio mpv handbrake kdeconnect gnome-shell-extension-gsconnect -y

sudo apt purge firefox-esr gnome-music gnome-video-effects totem* rhythmbox* shotwell* libreoffice-* gnome-system-monitor vlc pidgin* brasero* hexchat* gdebi* sound-juicer yt-dlp -y
sudo apt autoremove -y

flatpak install flathub io.missioncenter.MissionCenter
flatpak install flathub com.github.scrivanolabs.scrivano

