#!/usr/bin/env bash


## init
THE_BASE_DIR_PATH=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
source "$THE_BASE_DIR_PATH/_init.sh"


## main
main_pkg_install () {
	sudo apt-get install $(pkg_list_find)
}

main_pkg_install "$@"
