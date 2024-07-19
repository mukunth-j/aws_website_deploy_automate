#!/bin/bash

# Navigate to the directory
cd /home/ubuntu/website/

# Remove the existing build directory
sudo rm -rf afott_build

# Clone the repository
git clone https://github.com/mukunth-j/afott_build

# Navigate to the web server directory
cd /var/www/html/

# Remove the existing static directory and all files
sudo rm -rf static
sudo rm *

# Copy the new build files to the web server directory
sudo cp -r /home/ubuntu/website/afott_build/* /var/www/html/

# Restart the nginx service
sudo systemctl restart nginx
