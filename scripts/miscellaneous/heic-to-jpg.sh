#!/bin/bash
#

sudo apt install libheif-examples
for i in *.HEIC; do heif-convert "$i" "${i%.HEIC}.jpg"; done
