#!/bin/bash

# VS Code Installation Script for Kubuntu
# This script downloads and installs Microsoft's VS Code on Kubuntu

set -e  # Exit on any error

echo "=========================================="
echo "VS Code Installation Script for Kubuntu"
echo "=========================================="
echo ""

# Check if running on a Debian/Ubuntu-based system
if ! command -v apt-get &> /dev/null; then
    echo "Error: apt-get not found. This script requires a Debian/Ubuntu-based system."
    exit 1
fi

echo "Step 1: Updating package manager..."
sudo apt-get update
echo "✓ Package manager updated"
echo ""

echo "Step 2: Installing dependencies..."
sudo apt-get install -y software-properties-common apt-transport-https curl
echo "✓ Dependencies installed"
echo ""

echo "Step 3: Adding Microsoft's GPG key..."
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /usr/share/keyrings/microsoft-archive-keyring.gpg > /dev/null
echo "✓ GPG key added"
echo ""

echo "Step 4: Adding VS Code repository..."
echo "deb [arch=amd64,arm64,armhf signed-by=/usr/share/keyrings/microsoft-archive-keyring.gpg] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
echo "✓ Repository added"
echo ""

echo "Step 5: Updating package manager again..."
sudo apt-get update
echo "✓ Package manager updated"
echo ""

echo "Step 6: Installing VS Code..."
sudo apt-get install -y code
echo "✓ VS Code installed successfully!"
echo "  "

echo "=========================================="
echo "Installation Complete!"
echo "=========================================="
echo ""
echo "You can now launch VS Code by running:"
echo "  code"
echo ""
echo "Or search for 'Visual Studio Code' in your applications menu."
