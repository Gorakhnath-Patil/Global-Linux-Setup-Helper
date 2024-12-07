#!/bin/bash

# This script installs applications specific to Ubuntu/Debian-based distributions
# It installs packages using the `apt` package manager
# The script assumes that the system is running Ubuntu or any Debian-based distribution

# Function to install basic applications for Ubuntu/Debian (from the config.yaml list)
install_basic_apps() {
    echo "Installing basic applications on Ubuntu/Debian..."
    for app in "${selected_apps[@]}"; do
        case "$app" in
            "VLC")
                apt install -y vlc || { echo "Failed to install VLC. Exiting."; exit 1; }
                ;;
            "Chrome")
                apt install -y google-chrome-stable || { echo "Failed to install Chrome. Exiting."; exit 1; }
                ;;
            "Brave")
                apt install -y brave-browser || { echo "Failed to install Brave. Exiting."; exit 1; }
                ;;
            "Steam")
                apt install -y steam || { echo "Failed to install Steam. Exiting."; exit 1; }
                ;;
            "Wine")
                apt install -y wine || { echo "Failed to install Wine. Exiting."; exit 1; }
                ;;
            "Emulators")
                apt install -y retroarch || { echo "Failed to install Emulators. Exiting."; exit 1; }
                ;;
            "Python")
                apt install -y python3 || { echo "Failed to install Python. Exiting."; exit 1; }
                ;;
            "Go")
                apt install -y golang || { echo "Failed to install Go. Exiting."; exit 1; }
                ;;
            "Java")
                apt install -y openjdk-8-jdk || { echo "Failed to install Java. Exiting."; exit 1; }
                ;;
            "Atom")
                apt install -y atom || { echo "Failed to install Atom. Exiting."; exit 1; }
                ;;
            "Git")
                apt install -y git || { echo "Failed to install Git. Exiting."; exit 1; }
                ;;
            *)
                echo "Application $app not found in Ubuntu/Debian package repositories. Skipping."
                ;;
        esac
    done
    echo "All selected applications installed successfully on Ubuntu/Debian."
}

# Call the installation function for Ubuntu/Debian
install_basic_apps
