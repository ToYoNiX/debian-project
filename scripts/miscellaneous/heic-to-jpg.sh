#!/bin/bash
#

echo "HEIC to JPG Converter"

# Define the package to be installed
package="libheif-examples"

# Function to install the required package
install_package () {
    sudo apt update
    sudo apt install -y "$package"
}

# Function to check if the package is installed
is_package_installed () {
    dpkg -l | grep -q "$package"
}

# Attempt to install the package up to 3 times
for (( attempt=1 ; attempt<=3 ; attempt++ )); do
    echo "Attempt number $attempt: Installing $package..."
    install_package

    if is_package_installed; then
        echo "$package installed successfully."
        break
    else
        echo "Failed to install $package. Retrying..."
    fi
done

# Check if the package was installed successfully
if ! is_package_installed; then
    echo "Failed to install $package after multiple attempts."
    exit 1
fi

# Function to convert HEIC files in a specified directory or file
convert_heic_to_jpg () {
    local input=$1

    if [ -d "$input" ]; then
        # Convert HEIC files in the specified directory
        echo "Converting HEIC files in directory: $input"
        for file in "$input"/*.HEIC; do
            if [ -f "$file" ]; then
                heif-convert "$file" "${file%.HEIC}.jpg"
                echo "Converted $file to ${file%.HEIC}.jpg"
            else
                echo "No HEIC files found in the directory."
            fi
        done
    elif [ -f "$input" ]; then
        # Convert a single HEIC file
        echo "Converting single file: $input"
        heif-convert "$input" "${input%.HEIC}.jpg"
        echo "Converted $input to ${input%.HEIC}.jpg"
    else
        echo "Error: File or directory does not exist."
        exit 1
    fi
}

# Get user input
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <directory_or_file>"
    exit 1
fi

convert_heic_to_jpg "$1"
