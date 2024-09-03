#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <project_path> <virtualenv_name>"
  exit 1
fi

# Assign arguments to variables
path=$1
name=$2

# Navigate to the project path and activate the virtual environment
echo "Navigating to $path and activating the virtual environment..."
cd "$path" || { echo "Failed to navigate to the specified path."; exit 1; }
source "$name/bin/activate"

echo "Flask environment activated. You can now start developing your Flask application."
