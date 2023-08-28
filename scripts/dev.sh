#!/bin/bash

help() {
    clear
    echo -e "\e[32mUsage: dev [function]\e[0m"
    echo -e "\e[32mVersion: 0.1.1\e[0m"
    echo
    echo -e "\e[32mAvailable functions:\e[0m"
    echo -e "  \e[32mdex\e[0m              - SSH into a Docker container with shell."
    echo -e "  \e[32mdexb\e[0m             - SSH into a Docker container with bash."
    echo -e "  \e[32mdnames\e[0m           - Get a list of container names."
    echo -e "  \e[32mdremove\e[0m          - Remove all containers."
    echo -e "  \e[32mdip\e[0m              - Get IP addresses of all named running containers."
    echo -e "  \e[32mdcompose\e[0m         - Run docker-compose in a targeted directory."
    echo -e "  \e[32mdupdate\e[0m          - Update all existing Docker images to the latest."
    echo -e "  \e[32mdclean\e[0m           - Remove dangling Docker images."
    echo -e "  \e[32mdinspect\e[0m         - Inspect a docker container."
    echo -e "  \e[32mdc\e[0m               - Execute a command in the container."
    echo -e "  \e[32martisan\e[0m          - Execute php artisan without php at start."

    
    echo
    echo "           For more information visit           "
    echo "   https://github.com/mattiasghodsian/configs   "
    echo
}

dex() {
    if [ -z "$1" ]; then
        echo "Please provide the Docker container to access."
    else
        docker exec -u root -it $1 /bin/sh
    fi
}

dexb() {
    if [ -z "$1" ]; then
        echo "Please provide the Docker container to access."
    else
        docker exec -u root -it $1 /bin/bash
    fi
}

dnames() {
    for ID in $(docker ps | awk '{print $1}' | grep -v 'CONTAINER'); do
        docker inspect $ID | grep Name | head -1 | awk '{print $2}' | sed 's/,//g' | sed 's%/%%g' | sed 's/"//g'
    done
}

dip() {
    echo "IP addresses of all named running containers"

    for DOC in $(dnames); do
        IP=$(docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}} {{end}}' "$DOC")
        OUT+=$DOC'\t'$IP'\n'
    done
    echo -e $OUT | column -t
    unset OUT
}

dcompose() {
    DIR="/home/$USER/Projects/$1/"

    if [ ! -d "$DIR" ]; then
        echo "Directory '$DIR' not found. Creating directory..."
        mkdir -p "$DIR"
    fi

    shift
    cd "$DIR"
    docker-compose "$@"
}

dupdate() {
    docker images | grep -v REPOSITORY | awk '{print $1}' | xargs -L1 docker pull
}

dclean() {
    docker rm -v $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
    docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
}

dinspect() {
    if [ -z "$1" ]; then
        echo "Please provide Docker container to inspect."
    else
        docker inspect $1
    fi

}

artisan() {
    php artisan "$@"
}

dc() {
    if [ $# -eq 0 ]; then
        echo "Usage: dc [user] [container] [command] [--workdir <directory>]"
        echo "       user: User for the Docker container (default: root)"
        echo "       container: Docker container name"
        echo "       command: Command to execute in the container"
        echo "       --workdir (optional): Set the working directory in the container"
        return 1
    fi

    user="${1:-root}"
    container="${2}"
    workdir=""

    for ((i = 3; i <= $#; i++)); do
        if [ "${!i}" = "--workdir" ]; then
            workdir="${!((i + 1))}"
            break
        fi
    done
        
    if [ -n "$workdir" ]; then
        shift "$((i + 1))"
        docker exec --workdir "$workdir" --user "$user" "$container" bash -c "${@:3}"
    else
        docker exec --user "$user" "$container" bash -c "${@:3}"
    fi
}


dremove() {
    read -p "Are you sure ? (y/n): " choice
    if [[ $choice == "y" || $choice == "Y" ]]; then
        docker rm -f $(docker ps -a -q)
        echo "All Docker containers removed successfully."
    fi
}

# Check if a function is provided
if [ -n "$1" ]; then
    "$@"
else
    help
fi
