#!/bin/bash
#

# Append the lines to .bashrc
echo "# Add Arabic, using Shift + Alt" >> "$HOME/.bashrc"
echo "setxkbmap -model pc105 -layout us,ar -option 'grp:alt_shift_toggle'" >> "$HOME/.bashrc"
echo "Lines added to .bashrc successfully."
