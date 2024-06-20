#!/bin/bash
#

sudo rmmod nvidia_modeset nvidia_uvm nvidia
sudo modprobe -i vfio_pci vfio_pci_core vfio_iommu_type1 vfio_virqfd
