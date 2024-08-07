#!/bin/bash

# Update package list
echo "Updating package list..."
sudo apt update

# Install Node.js and npm
echo "Installing Node.js and npm..."
sudo apt install -y nodejs npm

# Verify installation
echo "Verifying Node.js and npm installation..."
node_version=$(node -v)
npm_version=$(npm -v)

if [ -z "$node_version" ]; then
  echo "Node.js installation failed."
  exit 1
else
  echo "Node.js version: $node_version"
fi

if [ -z "$npm_version" ]; then
  echo "npm installation failed."
  exit 1
else
  echo "npm version: $npm_version"
fi

# Install create-react-app globally
echo "Installing create-react-app..."
sudo npm install -g create-react-app

# Create a new React application
APP_NAME="my-app"
echo "Creating a new React application: $APP_NAME"
npx create-react-app $APP_NAME

# Navigate to the project directory
echo "Navigating to the project directory..."
cd $APP_NAME

# Start the development server
echo "Starting the React development server..."
npm start
