#!/bin/bash

# This script installs applications specific to openSUSE
# It installs packages using the `zypper` package manager
# The script assumes that the system is running openSUSE

# Function to install basic applications for openSUSE (from the config.yaml list)
install_basic_apps() {
    echo "Installing basic applications on openSUSE..."
    for app in "${selected_apps[@]}"; do
        case "$app" in
            "VLC")
                zypper install -y vlc || { echo "Failed to install VLC. Exiting."; exit 1; }
                ;;
            "Chrome")
                zypper install -y google-chrome-stable || { echo "Failed to install Chrome. Exiting."; exit 1; }
                ;;
            "Brave")
                zypper install -y brave-browser || { echo "Failed to install Brave. Exiting."; exit 1; }
                ;;
            "Steam")
                zypper install -y steam || { echo "Failed to install Steam. Exiting."; exit 1; }
                ;;
            "Wine")
                zypper install -y wine || { echo "Failed to install Wine. Exiting."; exit 1; }
                ;;
            "Emulators")
                zypper install -y retroarch || { echo "Failed to install Emulators. Exiting."; exit 1; }
                ;;
            "Python")
                zypper install -y python3 || { echo "Failed to install Python. Exiting."; exit 1; }
                ;;
            "Go")
                zypper install -y golang || { echo "Failed to install Go. Exiting."; exit 1; }
                ;;
            "Java")
                zypper install -y java-1_8_0-openjdk || { echo "Failed to install Java. Exiting."; exit 1; }
                ;;
            "Atom")
                zypper install -y atom || { echo "Failed to install Atom. Exiting."; exit 1; }
                ;;
            "Git")
                zypper install -y git || { echo "Failed to install Git. Exiting."; exit 1; }
                ;;
            *)
                echo "Application $app not found in openSUSE repositories. Skipping."
                ;;
        esac
    done
    echo "All selected applications installed successfully on openSUSE."
}

# Call the installation function for openSUSE
install_basic_apps
