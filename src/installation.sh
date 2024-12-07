#!/bin/bash

# This script handles the installation of the selected applications.
# It runs the installation process based on the selected user type and detected OS.

# Function to install an application on Ubuntu/Debian-based distributions
install_ubuntu() {
    echo "Installing $1 on Ubuntu/Debian..."
    apt update
    apt install -y "$1" || { echo "Failed to install $1 on Ubuntu/Debian. Exiting."; exit 1; }
}

# Function to install an application on Arch Linux-based distributions
install_arch() {
    echo "Installing $1 on Arch Linux..."
    pacman -Syu --noconfirm "$1" || { echo "Failed to install $1 on Arch Linux. Exiting."; exit 1; }
}

# Function to install an application on Fedora/CentOS-based distributions
install_fedora() {
    echo "Installing $1 on Fedora/CentOS..."
    dnf install -y "$1" || { echo "Failed to install $1 on Fedora/CentOS. Exiting."; exit 1; }
}

# Function to install an application on openSUSE
install_opensuse() {
    echo "Installing $1 on openSUSE..."
    zypper install -y "$1" || { echo "Failed to install $1 on openSUSE. Exiting."; exit 1; }
}

# Main function to install the selected applications based on the detected OS
install_apps() {
    # Loop through each selected app and install it based on the OS
    for app in "${selected_apps[@]}"; do
        case "$os" in
            "ubuntu" | "debian")
                install_ubuntu "$app"
                ;;
            "arch")
                install_arch "$app"
                ;;
            "fedora" | "centos")
                install_fedora "$app"
                ;;
            "opensuse")
                install_opensuse "$app"
                ;;
            *)
                echo "Unsupported OS detected: $os. Exiting."
                exit 1
                ;;
        esac
    done

    # If all apps are installed successfully
    echo "Installation completed successfully."
}
