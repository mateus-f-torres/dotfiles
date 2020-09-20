#!/bin/bash
# Get user id
USERID=$(id -u)

# Verify that user is root
if [[ "${USERID}" -eq 0 ]]
then
  # Update Packages
  apt-get update
  # Upgrade Packages
  apt-get upgrade
  # Install Tree
  apt-get install -y tree
  # Install Htop
  apt-get install -y htop
  # Install Git
  apt-get install -y git
  # Install Curl
  apt-get install -y curl
  # Install NodeJS v14.x
  curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
  sudo apt-get install -y nodejs
  # Install Node Version Manager v0.35.3
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
  exit 0
else
  echo "ERROR: user is not root"
  exit 1
fi




