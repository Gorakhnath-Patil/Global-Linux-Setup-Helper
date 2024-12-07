#!/bin/bash

# This script installs applications specific to Arch Linux
# It installs packages using the `pacman` package manager
# The script assumes that the system is running Arch Linux

# Function to install basic applications for Arch Linux (from the selected apps)
install_basic_apps() {
    echo "Installing selected applications on Arch Linux..."

    # Iterate over each selected application passed as arguments
    for app in "$@"; do
        case "$app" in
            "VLC")
                pacman -S --noconfirm vlc || { echo "Failed to install VLC. Exiting."; exit 1; }
                ;;
            "Chrome")
                pacman -S --noconfirm google-chrome || { echo "Failed to install Chrome. Exiting."; exit 1; }
                ;;
            "Brave")
                pacman -S --noconfirm brave || { echo "Failed to install Brave. Exiting."; exit 1; }
                ;;
            "Steam")
                pacman -S --noconfirm steam || { echo "Failed to install Steam. Exiting."; exit 1; }
                ;;
            "Wine")
                pacman -S --noconfirm wine || { echo "Failed to install Wine. Exiting."; exit 1; }
                ;;
            "Emulators")
                pacman -S --noconfirm retroarch || { echo "Failed to install Emulators. Exiting."; exit 1; }
                ;;
            "Python")
                pacman -S --noconfirm python || { echo "Failed to install Python. Exiting."; exit 1; }
                ;;
            "Go")
                pacman -S --noconfirm go || { echo "Failed to install Go. Exiting."; exit 1; }
                ;;
            "Java")
                pacman -S --noconfirm jdk-openjdk || { echo "Failed to install Java. Exiting."; exit 1; }
                ;;
            "Atom")
                # Check if Atom is available in the official repo or AUR
                pacman -S --noconfirm atom || {
                    # If Atom fails from official repo, try installing via AUR using yay
                    if ! command -v yay &> /dev/null; then
                        echo "Yay (AUR helper) is not installed. Installing yay..."
                        pacman -S --noconfirm yay || { echo "Failed to install yay. Exiting."; exit 1; }
                    fi
                    yay -S --noconfirm atom || { echo "Failed to install Atom from AUR. Exiting."; exit 1; }
                }
                ;;
            "Git")
                pacman -S --noconfirm git || { echo "Failed to install Git. Exiting."; exit 1; }
                ;;
            *)
                echo "Application $app not found in Arch package repositories or AUR. Skipping."
                ;;
        esac
    done

    echo "All selected applications installed successfully on Arch Linux."
}

# Call the installation function for Arch Linux with the passed arguments (selected apps)
install_basic_apps "$@"
