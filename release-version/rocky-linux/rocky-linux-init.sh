#!/bin/bash
# Description: A script to check system version and install tools on Rocky Linux.
# Author: Jackliu (ljq@GitHub)
# Usage: ./rocky-linux-init.sh
# Version: 1.1
# Date: 2023-07-04
# License: MIT
# Page Site: https://github.com/ljq

# Define tools list in lowercase
tools=(
    "vim"          # 0
    "ping"         # 1
    "net-tools"    # 2
    "firewalld"    # 3
    "tar"          # 4
    "gzip"         # 5
    "bzip2"        # 6
    "wget"         # 7
    "curl"         # 8
    "python3"      # 9
    "git"          # 10
    "ncurses"      # 11
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
        elif [[ $tool_name == "ncurses" ]]; then
            clear -V >/dev/null 2>&1
        elif [[ $tool_name == "net-tools" ]]; then
            netstat --version >/dev/null 2>&1
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

    if [[ ${#not_installed[@]} -gt 0 ]]; then
        echo -e "\n=== Tools Not Installed ==="
        for index in "${not_installed[@]}"; do
            tool_name="${tools[$index]}"
            echo -e "\033[0;31m[${index}] ${tool_name}\033[0m"  # Print in red color
        done
    fi
    echo
}

# Function to install selected tool
install_tool() {
    local tool_index=$1
    local tool_name="${tools[$tool_index]}"

    echo "Installing ${tool_name}..."
    sudo dnf install -y "${tool_name}"
    echo "${tool_name} installed successfully."
    echo
}

# Function to handle user input for installation
handle_install_input() {
    local input="$1"
    local valid_choices=()

    if [[ "$input" == "all" ]]; then
        valid_choices=("${!tools[@]}")
    else
        IFS=',' read -ra choices <<< "$input"
        for choice in "${choices[@]}"; do
            if [[ $choice =~ ^[0-9]+$ ]]; then
                valid_choices+=("$choice")
            elif [[ $choice =~ ^[0-9]+-[0-9]+$ ]]; then
                range_start=$(echo "$choice" | cut -d'-' -f1)
                range_end=$(echo "$choice" | cut -d'-' -f2)
                if [[ $range_start -le $range_end && $range_start -ge 0 && $range_end -lt ${#tools[@]} ]]; then
                    for ((i=$range_start; i<=$range_end; i++)); do
                        valid_choices+=("$i")
                    done
                fi
            fi
        done
    fi

    if [[ ${#valid_choices[@]} -eq 0 ]]; then
        echo "Invalid input. Please enter valid tool numbers or 'all'."
        return 1
    fi

    for choice in "${valid_choices[@]}"; do
        install_tool "$choice"
    done
    return 0
}

# Main function
main() {
    list_tools
    check_installed

    read -p "Enter the numbers of the tools you want to install (e.g., 1,2,5 or 1-3 or all, 'quit' to exit): " input
    while [[ $input != "quit" ]]; do
        handle_install_input "$input"
        if [[ $? -eq 0 ]]; then
            check_installed
        fi
        read -p "Enter the numbers of the tools you want to install (e.g., 1,2,5 or 1-3 or all, 'quit' to exit): " input
    done

    echo "Quit."
}

main