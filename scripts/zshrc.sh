#!/bin/bash

zshrc_path="$HOME/.zshrc"

if [ -f "$zshrc_path" ]; then

    if grep -q "plugins=" "$zshrc_path"; then
        sed -i 's/plugins=.*/plugins=(git tmux)/' "$zshrc_path"
    fi

    if grep -q "ZSH_THEME=" "$zshrc_path"; then
        sed -i 's/ZSH_THEME=.*/ZSH_THEME="bira"/' "$zshrc_path"
    fi

    zsh -ic "source $HOME/.zshrc"

else
    echo "No .zshrc file found, skipping..."
fi
