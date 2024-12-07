#!/bin/bash

# This script performs a system update based on the detected Linux distribution.
# It ensures the system is up-to-date before starting the installation of applications.

# Function to update system on Ubuntu/Debian-based distributions
update_ubuntu() {
    echo "Updating system on Ubuntu/Debian..."
    apt update && apt upgrade -y && apt dist-upgrade -y || { echo "System update failed on Ubuntu/Debian. Exiting."; exit 1; }
    echo "System update completed successfully on Ubuntu/Debian."
}

# Function to update system on Arch Linux-based distributions
update_arch() {
    echo "Updating system on Arch Linux..."
    pacman -Syu --noconfirm || { echo "System update failed on Arch Linux. Exiting."; exit 1; }
    echo "System update completed successfully on Arch Linux."
}

# Function to update system on Fedora/CentOS-based distributions
update_fedora() {
    echo "Updating system on Fedora/CentOS..."
    dnf update -y || { echo "System update failed on Fedora/CentOS. Exiting."; exit 1; }
    echo "System update completed successfully on Fedora/CentOS."
}

# Function to update system on openSUSE
update_opensuse() {
    echo "Updating system on openSUSE..."
    zypper refresh && zypper update -y || { echo "System update failed on openSUSE. Exiting."; exit 1; }
    echo "System update completed successfully on openSUSE."
}

# Main function to update the system based on the detected OS
update_system() {
    case "$os" in
        "ubuntu" | "debian")
            update_ubuntu
            ;;
        "arch")
            update_arch
            ;;
        "fedora" | "centos")
            update_fedora
            ;;
        "opensuse")
            update_opensuse
            ;;
        *)
            echo "Unsupported OS detected for system update. Exiting."
            exit 1
            ;;
    esac
}

# Call the function to update the system based on the detected OS
update_system
