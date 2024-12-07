#!/bin/bash

# This script checks if the selected applications are already installed on the system
# It ensures that no duplicates are installed to prevent unnecessary re-installation

# Function to check if a software is already installed
check_duplicate() {
    app="$1"
    # Check if the application is already installed by checking its package status
    case "$os" in
        "ubuntu" | "debian")
            dpkg -l | grep -i "^ii  $app" &> /dev/null
            ;;
        "arch")
            pacman -Qs $app &> /dev/null
            ;;
        "fedora" | "centos")
            rpm -q $app &> /dev/null
            ;;
        "opensuse")
            zypper search --installed-only $app &> /dev/null
            ;;
        *)
            echo "Unsupported OS detected for duplicate check."
            exit 1
            ;;
    esac

    # If the application is installed, return true (0)
    if [ $? -eq 0 ]; then
        echo "$app is already installed. Skipping installation."
        return 0
    else
        echo "$app is not installed. Proceeding with installation."
        return 1
    fi
}

# Function to check duplicates for all selected apps
check_for_duplicates() {
    for app in "${selected_apps[@]}"; do
        check_duplicate "$app"
        # If the app is already installed, we skip it by not adding it to the install list
        if [ $? -eq 0 ]; then
            # Remove the app from the list of apps to install
            selected_apps=("${selected_apps[@]/$app}")
        fi
    done

    # If no apps are left to install, exit the script
    if [ ${#selected_apps[@]} -eq 0 ]; then
        echo "All selected applications are already installed. No further installation is needed."
        exit 0
    fi
}
