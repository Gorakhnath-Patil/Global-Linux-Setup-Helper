#!/bin/bash

# This script installs applications specific to Fedora/CentOS
# It installs packages using the `dnf` package manager
# The script assumes that the system is running Fedora

# Function to install basic applications for Fedora/CentOS (from the config.yaml list)
install_basic_apps() {
    echo "Installing basic applications on Fedora/CentOS..."
    for app in "${selected_apps[@]}"; do
        case "$app" in
            "VLC")
                dnf install -y vlc || { echo "Failed to install VLC. Exiting."; exit 1; }
                ;;
            "Chrome")
                dnf install -y google-chrome-stable || { echo "Failed to install Chrome. Exiting."; exit 1; }
                ;;
            "Brave")
                dnf install -y brave-browser || { echo "Failed to install Brave. Exiting."; exit 1; }
                ;;
            "Steam")
                dnf install -y steam || { echo "Failed to install Steam. Exiting."; exit 1; }
                ;;
            "Wine")
                dnf install -y wine || { echo "Failed to install Wine. Exiting."; exit 1; }
                ;;
            "Emulators")
                dnf install -y retroarch || { echo "Failed to install Emulators. Exiting."; exit 1; }
                ;;
            "Python")
                dnf install -y python3 || { echo "Failed to install Python. Exiting."; exit 1; }
                ;;
            "Go")
                dnf install -y golang || { echo "Failed to install Go. Exiting."; exit 1; }
                ;;
            "Java")
                dnf install -y java-1.8.0-openjdk || { echo "Failed to install Java. Exiting."; exit 1; }
                ;;
            "Atom")
                dnf install -y atom || { echo "Failed to install Atom. Exiting."; exit 1; }
                ;;
            "Git")
                dnf install -y git || { echo "Failed to install Git. Exiting."; exit 1; }
                ;;
            *)
                echo "Application $app not found in Fedora/CentOS package repositories. Skipping."
                ;;
        esac
    done
    echo "All selected applications installed successfully on Fedora."
}

# Call the installation function for Fedora
install_basic_apps
