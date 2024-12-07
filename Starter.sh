#!/bin/bash

# This script is the starter for the Global Linux Setup Helper project.
# It will ensure that all necessary scripts have execute permissions
# and then run the main installation script (install_software.sh).

# Get the absolute path of the current directory (project root)
PROJECT_ROOT="$(pwd)"

# Check if the necessary install script exists
if [ ! -f "$PROJECT_ROOT/bin/install_software.sh" ]; then
    echo "Error: 'bin/install_software.sh' not found. Please make sure you are in the correct directory."
    exit 1
fi

echo "Setting execute permissions for all required scripts..."

# Set execute permissions for all scripts in the 'bin' directory
chmod +x "$PROJECT_ROOT/bin/install_software.sh"

# Set execute permissions for all scripts in the 'src' directory (using wildcard for files inside 'src/')
chmod +x "$PROJECT_ROOT/src"/*.sh

# Set execute permissions for all scripts in the 'src/os-specific' directory (using wildcard for files inside 'os-specific/')
chmod +x "$PROJECT_ROOT/src/os-specific"/*.sh

# Make sure 'Starter.sh' is executable
chmod +x "$PROJECT_ROOT/Starter.sh"

# Make sure config.yaml is readable (it doesn't need to be executable)
chmod +r "$PROJECT_ROOT/config/config.yaml"

# Verify if permissions have been set correctly for critical scripts
if [ ! -x "$PROJECT_ROOT/bin/install_software.sh" ]; then
    echo "Error: Failed to set execute permissions for install_software.sh."
    exit 1
fi

# Now, run the install_software.sh script
echo "Running the installation process..."
sudo "$PROJECT_ROOT/bin/install_software.sh"

# Completion message
echo "Installation process completed successfully!"
