#!/bin/bash
# Description: A script to check system version and installed tools on Rocky Linux.
# Author: Jackliu (ljq@GitHub)
# Usage: ./firewalld-fast.sh
# Version: 1.0
# Date: 2023-07-04
# License: MIT
# Page Site: https://github.com/ljq

# ANSI Color Codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RESET='\033[0m' # No Color

# Function to display firewall rules
display_rules() {
    echo -e "${BLUE}Current Firewall Rules:${RESET}"
    sudo firewall-cmd --list-all
}

# Function to add a firewall rule for a specific port
add_port_rule() {
    local port=$1
    sudo firewall-cmd --permanent --add-port=$port/tcp
    sudo firewall-cmd --reload
    echo -e "Added port ${GREEN}$port${RESET} (${YELLOW}已添加端口${RESET} ${GREEN}$port${RESET})"
}

# Function to remove a firewall rule for a specific port
remove_port_rule() {
    local port=$1
    sudo firewall-cmd --permanent --remove-port=$port/tcp
    sudo firewall-cmd --reload
    echo -e "Removed port ${YELLOW}$port${RESET} (${YELLOW}已移除端口${RESET} ${YELLOW}$port${RESET})"
}

# Function to check firewall service status
check_service_status() {
    echo -e "${BLUE}Firewall Service Status:${RESET}"
    sudo systemctl status firewalld
}

# Function to start firewall service
start_firewall_service() {
    sudo systemctl start firewalld
    echo -e "Firewall service started (${GREEN}防火墙服务已启动${RESET})"
}

# Function to stop firewall service
stop_firewall_service() {
    sudo systemctl stop firewalld
    echo -e "Firewall service stopped (${YELLOW}防火墙服务已停止${RESET})"
}

# Function to enable firewall service to start on boot
enable_firewall_service() {
    sudo systemctl enable firewalld
    echo -e "Firewall service set to start on boot (${GREEN}防火墙服务已设置开机自启${RESET})"
}

# Function to disable firewall service from starting on boot
disable_firewall_service() {
    sudo systemctl disable firewalld
    echo -e "Firewall service disabled from starting on boot (${YELLOW}防火墙服务已禁止开机自启${RESET})"
}

# Main menu
while true; do
    echo -e "${BLUE}Firewall Management Script${RESET}"
    echo "1. Display Firewall Rules"
    echo "2. Add Port Rule"
    echo "3. Remove Port Rule"
    echo "4. Check Firewall Service Status"
    echo "5. Start Firewall Service"
    echo "6. Stop Firewall Service"
    echo "7. Enable Firewall Service on Boot"
    echo "8. Disable Firewall Service on Boot"
    echo "9. Exit"

    read -p "Enter your choice: " choice
    case $choice in
        1) display_rules ;;
        2) 
            echo -e "${BLUE}Enter the port to add (e.g., 80):${RESET}"
            read port
            add_port_rule $port ;;
        3) 
            echo -e "${BLUE}Enter the port to remove (e.g., 80):${RESET}"
            read port
            remove_port_rule $port ;;
        4) check_service_status ;;
        5) start_firewall_service ;;
        6) stop_firewall_service ;;
        7) enable_firewall_service ;;
        8) disable_firewall_service ;;
        9) echo -e "${BLUE}Exiting...${RESET}"; break ;;
        *) echo -e "${RED}Invalid choice. Please enter a valid option.${RESET}" ;;
    esac
done
