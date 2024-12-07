#!/bin/bash

# This script detects the Linux distribution based on the contents of /etc/os-release
# It helps identify the OS to select the appropriate installation method for the selected applications

# Function to detect the operating system from /etc/os-release
detect_os() {
    # Check for various OS distributions
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

# Main function to detect and store the OS
detect_and_set_os() {
    os=$(detect_os)

    if [ "$os" == "unsupported" ]; then
        echo "Unsupported OS detected. Please use a supported distribution (Ubuntu, Arch, Fedora, CentOS, or openSUSE). Exiting."
        exit 1
    else
        echo "Detected OS: $os"
    fi
}

# Call the function to detect and set the OS
detect_and_set_os
