#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <project_path> <virtualenv_name>"
  return 1
fi

# Assign arguments to variables
path=$1
name=$2

# Create the project path if it doesn't exist
echo "Creating project directory at $path..."
mkdir -p "$path"

# Install required packages with a loop to check installation success
required_packages=("python3-full" "python3-venv" "python3-pip")
attempts=3

for ((i=1; i<=attempts; i++)); do
  echo "Attempting to install required packages (Attempt $i)..."
  sudo apt update && sudo apt install -y "${required_packages[@]}"

  # Check if all packages were installed successfully
  all_installed=true
  for package in "${required_packages[@]}"; do
    if ! dpkg -l | grep -q "^ii  $package "; then
      echo "Failed to install $package."
      all_installed=false
      break
    fi
  done

  if [ "$all_installed" = true ]; then
    echo "All required packages installed successfully."
    break
  else
    echo "Some packages failed to install."
    if [ $i -eq $attempts ]; then
      echo "All attempts to install the required packages have failed. Exiting."
      return 1
    fi
  fi
done

# Navigate to the project path
echo "Navigating to $path..."
cd "$path" || { echo "Failed to navigate to the specified path."; return 1; }

# Create a virtual environment
echo "Creating virtual environment named $name..."
python3 -m venv "$name"

# Activate the virtual environment
echo "Activating the virtual environment..."
source "$name/bin/activate"

# Install Flask within the virtual environment
echo "Installing Flask in the virtual environment..."
pip install flask

# Create a basic Flask application
echo "Creating a basic Flask application in app.py..."
cat > app.py <<EOF
from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def index():
    return render_template("index.html")

if __name__ == "__main__":
    app.run(debug=True)
EOF

# Create the templates directory and the index.html file
echo "Creating templates directory and index.html file..."
mkdir -p templates
cat > templates/index.html <<EOF
<!DOCTYPE html>

<html>
    <head>
        <title>
            Flask!
        </title>
    </head>
    <body>
        Hello, Flask!
    </body>
</html>
EOF

# Final navigation and environment activation
echo "Navigating back to $path and activating the virtual environment..."
cd "$path" || { echo "Failed to navigate to the specified path."; return 1; }
source "$name/bin/activate"

echo "Flask environment activated. You can now start developing your Flask application."
