#!/bin/bash
#

sudo tee /etc/NetworkManager/conf.d/20-connectivity-fedora.conf <<EOF
[connectivity]
enabled=false
EOF
