#!/bin/bash
#

git clone https://github.com/AdnanHodzic/auto-cpufreq.git
cd auto-cpufreq && sudo ./auto-cpufreq-installer
cd ..
sudo rm -r auto-cpufreq
sudo auto-cpufreq --install
