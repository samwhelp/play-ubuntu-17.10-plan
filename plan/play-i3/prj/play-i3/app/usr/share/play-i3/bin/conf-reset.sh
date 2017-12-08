#!/usr/bin/env bash


## init
THE_BASE_DIR_PATH=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
source "$THE_BASE_DIR_PATH/_init.sh"


## func
run_i3_conf_reset () {

	echo cp "$THE_I3_CONF_RESET_FILE_PATH" "$THE_I3_CONF_MAIN_FILE_PATH"

	cp "$THE_I3_CONF_RESET_FILE_PATH" "$THE_I3_CONF_MAIN_FILE_PATH"

	#cat "$THE_I3_CONF_MAIN_FILE_PATH"

}

run_rofi_conf_reset () {

	echo cp "$THE_ROFI_CONF_RESET_FILE_PATH" "$THE_ROFI_CONF_MAIN_FILE_PATH"

	cp "$THE_ROFI_CONF_RESET_FILE_PATH" "$THE_ROFI_CONF_MAIN_FILE_PATH"

	#cat "$THE_ROFI_CONF_MAIN_FILE_PATH"

}

run_gtk2_conf_reset () {

	echo cp "$THE_GTK2_CONF_RESET_FILE_PATH" "$THE_GTK2_CONF_MAIN_FILE_PATH"

	cp "$THE_GTK2_CONF_RESET_FILE_PATH" "$THE_GTK2_CONF_MAIN_FILE_PATH"

	#cat "$THE_GTK2_CONF_MAIN_FILE_PATH"

}

run_gtk3_conf_reset () {

	echo cp "$THE_GTK3_CONF_RESET_FILE_PATH" "$THE_GTK3_CONF_MAIN_FILE_PATH"

	cp "$THE_GTK3_CONF_RESET_FILE_PATH" "$THE_GTK3_CONF_MAIN_FILE_PATH"

	#cat "$THE_GTK3_CONF_MAIN_FILE_PATH"

}

run_fcitx_conf_reset () {

	echo cp "$THE_FCITX_CONF_RESET_FILE_PATH" "$THE_FCITX_CONF_MAIN_FILE_PATH"

	cp "$THE_FCITX_CONF_RESET_FILE_PATH" "$THE_FCITX_CONF_MAIN_FILE_PATH"

	#cat "$THE_FCITX_CONF_MAIN_FILE_PATH"

	#im-config -n REMOVE

	fcitx-remote -r

}


## main
main_conf_reset () {
	xdg_dir_prepare

	run_i3_conf_reset

	run_rofi_conf_reset

	run_gtk2_conf_reset

	run_gtk3_conf_reset

	run_fcitx_conf_reset
}

main_conf_reset "$@"
