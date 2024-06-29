#!/bin/bash
#

sudo apt install git golang libglib2.0-dev libcairo2-dev build-essential libgtk-3-dev -y
git clone https://github.com/nwg-piotr/nwg-look.git
cd nwg-look/
make build
sudo make install
cd ..
sudo rm -r nwg-look/
