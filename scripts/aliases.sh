#!/bin/bash

read -p "$(tput setaf 2)>> Do you add custom bash aliases (y/n): $(tput sgr0)" choice


if [[ $choice == "y" || $choice == "Y" ]]; then
    cp ./scripts/afk.sh $HOME/afk.sh

    aliases="
function nodep-fn() {
    sudo lsof -i :$1
}

# tmux
alias tmx-n=\"tmux new-session -s \$1\"
alias tmx-d=\"tmux detach\"
alias tmx-s=\"tmux list-sessions\"
alias tmx-a=\"tmux a -t \$1\"

# Node
alias nodep=nodep-fn

# General
alias afk='./afk.sh'"

    echo "$aliases" >> "$HOME/.bash_aliases"
    echo ">> Aliases appended to .bash_aliases!"
else
    echo -e "\033[0;31m>> Add custom bash Aliases skipped.\033[0m"
fi
