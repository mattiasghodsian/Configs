#!/bin/bash

GREEN=$(tput setaf 2)
RED=$(tput setaf 1)
RESET=$(tput sgr0)

read -p "${GREEN}>> Do you want to install GTK4 theme files? (y/n): ${RESET}" nvmChoice
if [[ $nvmChoice == "y" || $nvmChoice == "Y" ]]; then
    
    echo "${GREEN}>> Installing Tweaks tool"
    sudo apt install -qq gnome-tweaks

    icons_dir="$HOME/.icons"
    themes_dir="$HOME/.themes"

    if [ ! -d "$icons_dir" ]; then
        mkdir -p "$icons_dir"
        echo "${GREEN}>> Created $icons_dir directory"
    fi

    if [ ! -d "$themes_dir" ]; then
        mkdir -p "$themes_dir"
        echo "${GREEN}>> Created $themes_dir directory"
    fi

    echo "${GREEN}>> Extracting icon theme files"
    for icon_archive in gnome/icons/*.tar.gz; do
        if [ -f "$icon_archive" ]; then
            theme_name=$(basename "$icon_archive" .tar.gz)
            tar -xf "$icon_archive" -C "$icons_dir"
            echo "Extracted $theme_name icon theme"
        fi
    done

    echo "${GREEN}>> Extracting theme files"
    for theme_archive in gnome/themes/*.tar.gz; do
        if [ -f "$theme_archive" ]; then
            theme_name=$(basename "$theme_archive" .tar.gz)
            tar -xf "$theme_archive" -C "$themes_dir"
            echo "Extracted $theme_name GTK4 theme"
        fi
    done

    # Start tweaks
    gnome-tweaks

else
    echo -e "${RED}>> GTK4 theme files skipped.${RESET}"
fi