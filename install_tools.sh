#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# List of tools to install
tools=(subfinder assetfinder amass nmap nikto zap-cli wapiti sqlmap aquatone)

# Update package list and install dependencies
echo "Updating package list..."
sudo apt-get update

# Install each tool
for tool in "${tools[@]}"; do
    if command_exists "$tool"; then
        echo -e "\e[32m$tool is already installed.\e[0m"
    else
        echo -e "\e[33mInstalling $tool...\e[0m"
        if [[ "$tool" == "zap-cli" ]]; then
            pip install zap-cli
        else
            sudo apt-get install -y "$tool"
        fi
    fi
done

echo -e "\e[32mAll tools installed successfully!\e[0m"
