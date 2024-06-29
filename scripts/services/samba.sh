#!/bin/bash
#

sudo apt install samba -y
sudo tee /etc/samba/smb.conf <<EOF
[share]
   path = /home/$USER/
   browseable = yes
   read only = no
   writable = yes
EOF

sudo systemctl restart smbd
sudo smbpasswd -a $USER
