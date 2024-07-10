## Linux Application Launcher

This script, named `apps.sh`, is a user-friendly, text-based application launcher designed to enhance your workflow on Linux systems.

## Installation

Download the Script: Save the source code in a zip file. Extract the files.
Move the script file `apps.sh` to a directory of your choice.

Make the Script Executable:

    Recommended: Grant execute permissions only to the script owner using:

    `chmod 555 apps.sh`

    Alternative (Less Secure): Grant execute permissions to everyone using:


    `chmod 777 apps.sh `
    (Use with caution!)

Run the Script: Navigate to the directory where you saved apps.sh and execute it using:

`./apps.sh`
## Functionality

Lists Installed Applications: Upon launch, the script displays a list of both snap applications and other installed applications on your system.
Easy Application Launch: Simply type the name of the desired application from the list and press Enter to execute it.
## Example

Imagine you have VS Code installed via Snap. The script will display "code" among the listed snaps. Enter "code" and press Enter, and the script will launch VS Code for you.

## Additional Notes

For enhanced security, it's highly recommended to use the first chmod option (chmod 555) to grant execute permissions only to the script owner.
This script is a helpful tool for quickly launching applications without navigating through menus or graphical interfaces.