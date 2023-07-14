#!/bin/bash

read -p "$(tput setaf 2)>> Do you want to install NVM? (y/n): $(tput sgr0)" choice


if [[ $choice == "y" || $choice == "Y" ]]; then
    LATEST_VERSION=$(curl --silent "https://api.github.com/repos/nvm-sh/nvm/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/$LATEST_VERSION/install.sh | bash
    echo ">> NVM installed successfully!"
else
    echo -e "\033[0;31m>> NVM installation skipped.\033[0m"
fi
