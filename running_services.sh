#!/bin/bash

# Check if systemctl is available
if ! command -v systemctl &> /dev/null; then
    echo "systemctl command not found. This script requires systemd-based system."
    exit 1
fi

echo "Fetching running services..."

# Fetch and format running services
echo -e "UNIT                          LOAD   ACTIVE SUB     DESCRIPTION"
echo -e "--------------------------------------------------------------"

# Extract and format the service information
systemctl list-units --type=service --state=running | awk 'NR>1 {printf "%-30s %-7s %-6s %-10s %s\n", $1, $2, $3, $4, substr($0, index($0, $5))}'

# Add legend for better understanding
echo -e "\nLegend:"
echo -e "  UNIT        → Service unit name"
echo -e "  LOAD        → Whether the unit definition was properly loaded"
echo -e "  ACTIVE      → High-level activation state of the unit"
echo -e "  SUB         → Low-level unit activation state"
echo -e "  DESCRIPTION → Service description"
