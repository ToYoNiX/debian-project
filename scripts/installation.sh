#!bin/bash

# Imlementing a function to detect all DE/WM

function detect_de_wm() {
  # Check for common Desktop Environments
  if [ -f /etc/X11/xsession-startup ]; then  # Gnome/KDE
    if grep -q gnome /etc/X11/xsession-startup; then
      echo "Detected Desktop Environment: Gnome"
    elif grep -q plasma /etc/X11/xsession-startup; then
      echo "Detected Desktop Environment: KDE"
    fi
  elif [ -f ~/.fluxbox/startup ]; then  # Fluxbox
    echo "Detected Window Manager: Fluxbox"
  elif [ -f ~/.icewm/preferences ]; then  # IceWM
    echo "Detected Window Manager: IceWM"
  else  # Fallback
    echo "Unable to detect Desktop Environment/Window Manager"
  fi
}


# Function to offer the user to remove old DE/WM or not, before installing a new one

function remove_old_de_wm()
{}
