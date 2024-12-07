#!/bin/bash

# Main script to run the installation process for the "Global Linux Setup Helper" project

# Function to check for root user (to ensure the script is being run as root, since installation requires sudo)
check_root() {
    if [ "$(id -u)" -ne 0 ]; then
        echo "This script must be run as root (use sudo)"
        exit 1
    fi
}

# Function to detect the operating system using /etc/os-release
detect_os() {
    if grep -qi "ubuntu" /etc/os-release; then
        echo "ubuntu"
    elif grep -qi "arch" /etc/os-release; then
        echo "arch"
    elif grep -qi "fedora" /etc/os-release; then
        echo "fedora"
    elif grep -qi "centos" /etc/os-release; then
        echo "centos"
    elif grep -qi "opensuse" /etc/os-release; then
        echo "opensuse"
    else
        echo "unsupported"
    fi
}

# Function to show the main user selection menu
show_user_selection_menu() {
    echo "Select the type of installation:"
    echo "1. Normal User (Basic multimedia applications)"
    echo "2. Software Developer (Development tools)"
    echo "3. Gamer (Gaming tools)"
    read -p "Enter the number of your choice (1-3): " choice

    case "$choice" in
        1) user_type="normal_user" ;;
        2) user_type="developer" ;;
        3) user_type="gamer" ;;
        *) echo "Invalid selection. Exiting."; exit 1 ;;
    esac
}

# Function to show the selected applications based on the user type
show_app_selection() {
    echo "Selecting apps for $user_type..."
    # Define available apps for each user type
    case "$user_type" in
        "normal_user") apps=("VLC" "Chrome" "Brave") ;;
        "developer") apps=("Python" "Go" "Java" "Atom" "Git") ;;
        "gamer") apps=("Steam" "Wine" "Emulators") ;;
        *) echo "Unknown user type. Exiting."; exit 1 ;;
    esac

    # Display available apps
    echo "Available apps to install:"
    for i in "${!apps[@]}"; do
        echo "$((i+1))) ${apps[$i]}"
    done

    # Prompt user to select multiple apps
    echo "Please select the apps to install (separate by spaces): "
    read -a selected_apps
}

# Function to install the selected applications
install_apps() {
    if [ ${#selected_apps[@]} -eq 0 ]; then
        echo "No apps selected for installation. Exiting."
        exit 1
    fi

    echo "Installing selected apps: ${selected_apps[@]}..."
    
    # Detect OS and call the corresponding installation script
    os=$(detect_os)
    case "$os" in
        "ubuntu") ./src/os-specific/ubuntu.sh "${selected_apps[@]}" ;;
        "arch") ./src/os-specific/arch.sh "${selected_apps[@]}" ;;
        "fedora") ./src/os-specific/fedora.sh "${selected_apps[@]}" ;;
        "centos") ./src/os-specific/centos.sh "${selected_apps[@]}" ;;
        "opensuse") ./src/os-specific/opensuse.sh "${selected_apps[@]}" ;;
        *) echo "Unsupported OS detected: $os. Exiting."; exit 1 ;;
    esac
}

# Main function to orchestrate the installation process
main() {
    check_root
    show_user_selection_menu
    show_app_selection
    install_apps
    echo "Installation process completed successfully."
}

# Call the main function to start the script
main
