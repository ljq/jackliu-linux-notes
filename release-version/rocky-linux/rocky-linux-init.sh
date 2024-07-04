#!/bin/bash
# Description: A script to check system version and installed tools on Rocky Linux.
# Author: Jackliu (ljq@GitHub)
# Usage: ./rocky-linux-init.sh
# Version: 1.0
# Date: 2023-07-04
# License: MIT
# Page Site: https://github.com/ljq

# Function to get system version
get_system_version() {
    echo "=== System Version ==="
    cat /etc/*release | grep PRETTY_NAME | cut -d'"' -f2
    echo
}

# Define tools list in lowercase
tools=(
    "vim"          # 0
    "ping"         # 1
    "netstat"      # 2
    "htop"         # 3
    "tar"          # 4
    "gzip"         # 5
    "bzip2"        # 6
    "wget"         # 7
    "curl"         # 8
    "python 3"     # 9
)

# Function to list tools with numbers
list_tools() {
    echo "=== Tools List ==="
    for index in "${!tools[@]}"; do
        echo "[${index}] ${tools[$index]}"
    done
    echo
}

# Function to check installed tools
check_installed() {
    local installed=()
    local not_installed=()

    echo "=== Installed Tools ==="
    echo "Installed tools:"

    for index in "${!tools[@]}"; do
        tool_name="${tools[$index]}"
        if [[ $tool_name == "python 3" ]]; then
            python3 --version >/dev/null 2>&1
        else
            command -v "${tool_name}" >/dev/null 2>&1
        fi
        
        if [[ $? -eq 0 ]]; then
            installed+=("$index")
            echo "[${index}] ${tools[$index]}"  # Display tool name with correct index
        else
            not_installed+=("$index")
        fi
    done

    echo
    echo "=== Not Installed Tools ==="
    echo "Not installed tools:"

    for index in "${not_installed[@]}"; do
        echo "[${index}] ${tools[$index]}"  # Display tool name with correct index
    done

    echo
}

# Function to install selected tool
install_tool() {
    local tool_index=$1
    local tool_name="${tools[$tool_index]}"

    echo "Installing ${tool_name}..."
    if [[ "${tool_name}" == "python 3" ]]; then
        sudo dnf install -y python3
    else
        sudo dnf install -y "${tool_name}"
    fi
    
    echo "${tool_name} installed successfully."
    echo
}

# Main function
main() {
    get_system_version
    list_tools
    check_installed

    read -p "Enter the numbers of the tools you want to install (comma-separated, 0 to quit): " input
    while [[ $input != "0" ]]; do
        IFS=',' read -ra choices <<< "$input"
        valid_choice=true

        for choice in "${choices[@]}"; do
            choice=$(echo "$choice" | tr -d ' ')  # Remove any spaces
            if [[ ! $choice =~ ^[0-9]+$ || $choice -ge ${#tools[@]} || $choice -lt 0 ]]; then
                echo "Invalid choice: $choice. Please enter valid tool numbers."
                valid_choice=false
                break
            fi
        done

        if [[ $valid_choice == true ]]; then
            for choice in "${choices[@]}"; do
                if [[ $choice -ne 0 ]]; then
                    install_tool "$choice"
                else
                    break
                fi
            done
        fi

        check_installed
        read -p "Enter the numbers of the tools you want to install (Support comma separated multiple digits, 0 to quit): " input
    done

    echo "Quit."
}

main