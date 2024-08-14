#!/bin/bash
#

sudo apt install gufw

sudo ufw limit 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw allow 1714:1764/udp
sudo ufw allow 1714:1764/tcp
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable
