#!/bin/bash
#

sudo apt install zram-tools
sudo tee /etc/default/zramswap <<EOF
PERCENT=100
EOF
sudo systemctl restart zramswap
