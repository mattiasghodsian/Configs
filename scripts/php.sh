#!/bin/bash

read -p "$(tput setaf 2)>> Do you want to install PHP 8.1? (y/n): $(tput sgr0)" choice


if [[ $choice == "y" || $choice == "Y" ]]; then
    sudo apt install --no-install-recommends php8.1
    sudo apt-get install -y php8.1-cli php8.1-common php8.1-mysql php8.1-zip php8.1-gd php8.1-mbstring php8.1-curl php8.1-xml php8.1-bcmath
    echo ">> PHP 8.1 installed successfully!"
else
    echo -e "\033[0;31m>> PHP 8.1 installation skipped.\033[0m"
fi