#!/bin/bash

# Function to check if a program is installed
function is_installed() {
  command -v "$1" &> /dev/null
}

# Function to log application execution results (success/failure)
function log_app_result() {
  local app_name="$1"
  local result="$2"  # "success" or "failure"

  # Append result to a log file (e.g., app_execution_log.txt)
  echo "$(date +'%Y-%m-%d %H:%M:%S') - $app_name: $result" >> app_execution_log.txt
}

echo "**Snaps**"
# List snap applications with names
snap list | awk '{print $1}'  # Only show names

echo ""  # Add a blank line for separation

echo "**Other Applications**"
# Option 1: Using dpkg (for Debian-based systems like Ubuntu)
if [ -f /etc/apt/apt.conf ]; then
  dpkg-query -l | grep ^ii | awk '{print $2}'  # List installed package names
fi

# Option 2: Using yum (for RPM-based systems like Fedora, RHEL)
if [ -f /etc/yum.conf ]; then
  yum list installed | awk '{print $1}'  # List installed package names
fi

echo ""  # Add another blank line

echo "**Choose an application to run (or enter 'q' to quit):**"
read -r chosen_app

# Check for previous execution result
previous_result=$(tail -n 1 app_execution_log.txt | awk '{print $NF}')  # Get last line's result (success/failure)

if [ "$previous_result" == "failure" ] && [ "$chosen_app" == "$(echo "$previous_result" | cut -d ':' -f 1)" ]; then
  echo "Warning: $chosen_app crashed during the last execution. It might have display limitations."
fi

# Loop until user enters 'q' or a valid application name
while [ "$chosen_app" != "q" ]
do
  # Check if application is installed
  if is_installed "$chosen_app"; then
    # Execute the application
    $chosen_app
    log_app_result "$chosen_app" "success"  # Log successful execution
    break  # Exit the loop after successful execution
  else
    echo "Error: Application '$chosen_app' not found."
    echo "**Choose an application to run (or enter 'q' to quit):**"
    read -r chosen_app
  fi
done

echo "Exiting..."