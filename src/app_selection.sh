#!/bin/bash

# Displays the application selection menu for the user
echo "Select your apps:"
echo "1) Python"
echo "2) Go"
echo "3) Java"
echo "4) Atom"
echo "5) Git"

# Prompt the user to select apps
read -p "Please select the apps to install (separate by spaces): " app_selection

# Convert the input into an array of selected app names
selected_apps=()
for selection in $app_selection; do
    case $selection in
        1)
            selected_apps+=("Python")
            ;;
        2)
            selected_apps+=("Go")
            ;;
        3)
            selected_apps+=("Java")
            ;;
        4)
            selected_apps+=("Atom")
            ;;
        5)
            selected_apps+=("Git")
            ;;
        *)
            echo "Invalid selection: $selection"
            ;;
    esac
done

# Show the apps selected
echo "You selected: ${selected_apps[@]}"

# Pass the selected apps array to the installation script
./bin/install_software.sh "${selected_apps[@]}"
