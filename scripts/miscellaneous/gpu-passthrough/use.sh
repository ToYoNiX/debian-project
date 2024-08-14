#!/bin/bash
#

sudo rmmod vfio_pci vfio_pci_core vfio_iommu_type1 vfio_virqfd
sudo modprobe -i nvidia-current-modeset nvidia-current-uvm nvidia-current
