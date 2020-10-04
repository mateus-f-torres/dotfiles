#!/bin/bash
USERID=$(id -u)

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
  curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
  sudo apt-get install -y nodejs
  # Install Node Version Manager v0.36.0
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh | bash
  exit 0
else
  echo "ERROR: user is not root"
  exit 1
fi




