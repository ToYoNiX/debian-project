#!/bin/bash
# Installing PyCharm

if ! command -v pycharm >/dev/null 2>&1; then
    echo "** Installing PyCharm...**"
    sudo snap install pycharm-professional --classic
else
    echo "PyCharm is already installed."
fi
