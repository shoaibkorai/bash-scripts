#!/bin/bash

# Update the package list
echo "Updating package list..."
sudo apt update

# Install the SSH client
echo "Installing SSH client..."
sudo apt install -y openssh-client

# Install the SSH server
echo "Installing SSH server..."
sudo apt install -y openssh-server

# Check the status of the SSH server
echo "Checking SSH server status..."
sudo systemctl status ssh

# Enable and start the SSH server if not already running
echo "Enabling and starting SSH server..."
sudo systemctl enable ssh
sudo systemctl start ssh

# Display the status of the SSH server
echo "SSH server status:"
sudo systemctl status ssh

# Optional: Display the SSH server listening ports
echo "SSH server listening on ports:"
sudo netstat -tulpn | grep ssh

echo "SSH client and server installation and configuration complete."
