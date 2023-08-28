#!/bin/bash

GREEN=$(tput setaf 2)
RED=$(tput setaf 1)
RESET=$(tput sgr0)

echo -e "\e[32m>> Updating apt and installing core packages.\e[0m"
sudo apt-get -qq update && sudo apt-get -qq install git curl tree vim

cd ./scripts/

read -p "${GREEN}>> Do you want to install NVM? (y/n): ${RESET}" nvmChoice
if [[ $nvmChoice == "y" || $nvmChoice == "Y" ]]; then
    ./installers/nvm.sh
else
    echo -e "${RED}>> NVM installation skipped.${RESET}"
fi

read -p "${GREEN}>> Do you want to install PHP 8.1? (y/n): ${RESET}" phpChoice
if [[ $phpChoice == "y" || $phpChoice == "Y" ]]; then
    ./installers/php.sh
else
    echo -e "${RED}>> PHP 8.1 installation skipped.${RESET}"
fi

read -p "${GREEN}>> Do you want to install Composer? (y/n): ${RESET}" composerChoice
if [[ $composerChoice == "y" || $composerChoice == "Y" ]]; then
    ./installers/composer.sh
else
    echo -e "${RED}>> Composer installation skipped.${RESET}"
fi

read -p "${GREEN}>> Do you want to install & configer ZSH? (y/n): ${RESET}" zshChoice
if [[ $zshChoice == "y" || $zshChoice == "Y" ]]; then
    ./installers/zsh.sh
else
    echo -e "${RED}>> ZSH installation skipped.${RESET}"
fi

read -p "${GREEN}>> Do you want to install git aliases? (y/n): ${RESET}" gitAliasChoice
if [[ $gitAliasChoice == "y" || $gitAliasChoice == "Y" ]]; then
    ./installers/gitalias.sh
else
    echo -e "${RED}>> Git alias installation skipped.${RESET}"
fi

read -p "${GREEN}>> Do you want to install fonts? (y/n): ${RESET}" fontsChoice
if [[ $fontsChoice == "y" || $fontsChoice == "Y" ]]; then
    ./installers/fonts.sh
else
    echo -e "${RED}>> Fonts installation skipped.${RESET}"
fi