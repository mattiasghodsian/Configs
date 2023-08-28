# Configs
This repository contains files and scripts to streamline my workflow and configure my system. The Makefile provides easy installation of my dev command, including frequently used commands and shortcuts. It also simplifies the installation of useful packages and configures files. It's especially useful for quickly setting up a fresh debian distros, allowing efficient customization and boosting productivity.

# Install
Open a terminal and navigate to the directory where the Makefile is located, run following command to install the scripts.

Install apps/themes
```
make install
```
Install only dev command
```
make install-dev
```
or 
```
make uninstall
```

then run dev
```
$ dev
```

```
Usage: dev [function]
Version: 0.1.1

Available functions:
  dex              - SSH into a Docker container with shell.
  dexb             - SSH into a Docker container with bash.
  dnames           - Get a list of container names.
  dremove          - Remove all containers.
  dip              - Get IP addresses of all named running containers.
  dcompose         - Run docker-compose in a targeted directory.
  dupdate          - Update all existing Docker images to the latest.
  dclean           - Remove dangling Docker images.
  dinspect         - Inspect a docker container.
  dc               - Execute a command in the container.
  artisan          - Execute php artisan without php at start.

           For more information visit           
   https://github.com/mattiasghodsian/configs

```

## TODO
- Add vscode, flameshot, postman, brave, dbeaver, docker, oh my zsh installers.
- Add script to install global npm packages like vue cli.
- Create a dev.config file in user home directory and load params example: Project directory path 
