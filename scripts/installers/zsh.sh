#!/bin/bash

zshrc_path="$HOME/.zshrc"

sudo apt-get -qq zsh

if [ -f "$zshrc_path" ]; then

    if grep -q "plugins=" "$zshrc_path"; then
        sed -i 's/plugins=.*/plugins=(git tmux)/' "$zshrc_path"
    fi

    if grep -q "ZSH_THEME=" "$zshrc_path"; then
        sed -i 's/ZSH_THEME=.*/ZSH_THEME="bira"/' "$zshrc_path"
    fi

    zsh -ic "source $HOME/.zshrc"

    echo -e "\e[32m>> .zshrc file updated.\e[0m"

else
    echo -e "\033[0;31m>> No .zshrc file found, skipping...\033[0m"
fi
