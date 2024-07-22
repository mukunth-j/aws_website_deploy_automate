#!/bin/bash
# Exit immediately if a command exits with a non-zero status
set -e
# Navigate to the directory
cd /home/ubuntu/website/
# Remove the existing build directory if it exists
if [ -d "afott_build" ]; then
    sudo rm -rf afott_build
fi
# Clone the repository
git clone https://github.com/mukunth-j/afott_build
# Navigate to the web server directory
cd /var/www/html/
# Remove the existing static directory and all files
if [ -d "static" ]; then
    sudo rm -rf static
fi
# Remove all files in the current directory
sudo rm -f *
# Copy the new build files to the web server directory
sudo cp -r /home/ubuntu/website/afott_build/* /var/www/html/
# Restart the nginx service
sudo systemctl restart nginx
echo "Deployment completed successfully."
