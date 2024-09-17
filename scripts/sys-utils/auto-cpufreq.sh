#!/bin/bash
#

git clone --depth 1 https://github.com/AdnanHodzic/auto-cpufreq.git
cd auto-cpufreq && sudo ./auto-cpufreq-installer
cd ..
sudo rm -r auto-cpufreq
sudo auto-cpufreq --install
