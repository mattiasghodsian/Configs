#!/bin/bash

read -p "$(tput setaf 2)>> Do you want to install Composer? (y/n): $(tput sgr0)" choice


if [[ $choice == "y" || $choice == "Y" ]]; then
    curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
    php -r "if (hash_file('SHA384', '/tmp/composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
    sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer
    echo ">> Composer installed successfully!"
else
    echo -e "\033[0;31m>> Composer installation skipped.\033[0m"
fi