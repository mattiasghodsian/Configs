#!/bin/bash

read -p "${GREEN}>> Do you want to install vim config? (y/n): ${RESET}" vimChoice
if [[ $vimChoice == "y" || $vimChoice == "Y" ]]; then
    
    cp configs/.vimrc ~/.vimrc
    mkdir -p ~/.vim ~/.vim/autoload ~/.vim/backup ~/.vim/colors ~/.vim/plugged

else
    echo -e "${RED}>> Vim config skipped.${RESET}"
fi