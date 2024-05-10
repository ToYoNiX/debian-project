#!/bin/bash
#

# Enable vfio drivers
sudo tee -a /etc/modules <<EOF
vfio
vfio_iommu_type1
vfio_pci
vfio_virqfd
EOF

sudo update-initramfs -u
