#!/bin/bash
#

# Function to reset permissions for a file or folder
reset_permissions () {
    local target=$1

    if [ -d "$target" ]; then
        echo "Resetting permissions for directory: $target"
        sudo chmod -R 755 "$target"
    elif [ -f "$target" ]; then
        echo "Resetting permissions for file: $target"
        sudo chmod 644 "$target"
    else
        echo "Error: $target is not a valid file or directory."
        exit 1
    fi

    echo "Permissions reset successfully for $target."
}

# Check if a target was provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <file_or_directory>"
    exit 1
fi

# Reset permissions for the specified file or directory
reset_permissions "$1"
