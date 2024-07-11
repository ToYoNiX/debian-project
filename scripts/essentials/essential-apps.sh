#!/bin/bash
#

sudo apt install vim curl wget tree uget gparted obs-studio mpv handbrake papirus-icon-theme bibata-cursor-theme kdeconnect gnome-shell-extension-gsconnect -y

sudo apt purge firefox-esr gnome-music gnome-video-effects totem* rhythmbox* shotwell* libreoffice-* gnome-system-monitor vlc pidgin* brasero* hexchat* gdebi* sound-juicer yt-dlp -y
sudo apt autoremove -y

flatpak install flathub io.missioncenter.MissionCenter
flatpak install flathub com.github.scrivanolabs.scrivano

wget https://raw.githubusercontent.com/ugetdm/uget-integrator/master/install/linux/install_uget_integrator.sh
chmod +x install_uget_integrator.sh
./install_uget_integrator.sh
rm install_uget_integrator.sh

sudo wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O /usr/bin/yt-dlp
sudo chmod a+rx /usr/bin/yt-dlp  # Make executable
