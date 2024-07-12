#!/bin/bash
#

sudo tee -a /etc/sysctl.conf <<EOF
vm.max_map_count=262144
EOF

sudo sysctl -p
