#!/bin/bash
#

sudo tee -a /etc/sysctl.conf <<EOF
vm.max_map_count=2147483642
EOF

sudo sysctl -p
