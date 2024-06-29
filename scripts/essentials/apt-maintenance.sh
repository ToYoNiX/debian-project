#!/bin/bash
#

sudo rm -rfv /var/lib/apt/lists/*
sudo apt-get clean
sudo apt-get update
sudo apt-get upgrade -y
