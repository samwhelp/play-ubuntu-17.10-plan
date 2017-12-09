#!/usr/bin/env bash


## init
THE_BASE_DIR_PATH=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
source "$THE_BASE_DIR_PATH/_init.sh"


## func

run_conf_reset_each () {
	local file_name
	local target_file_path
	local target_dir_path="$1"
	shift 1
	for file_name in $@; do
		target_file_path="$target_dir_path/$file_name"

		if [ -f "$target_file_path" ]; then
			##rm "$target_file_path"
			##echo rm "$target_file_path"

			echo > "$target_file_path"
		fi

	done
}

run_lxqt_conf_reset_each () {
	run_conf_reset_each "$THE_LXQT_CONF_MAIN_DIR_PATH" "$@"

}

#run_lxqt_conf_reset_each () {
#	local file_name
#	local target_file_path
#	local target_dir_path="$THE_LXQT_CONF_MAIN_DIR_PATH"
#	for file_name in $@; do
#		target_file_path="$target_dir_path/$file_name"
#
#		if [ -f "$target_file_path" ]; then
#			rm "$target_file_path"
#			echo rm "$target_file_path"
#		fi

#	done
#}

run_lxqt_conf_reset () {
	local file_list="globalkeyshortcuts.conf lxqt.conf panel.conf session.conf"

	run_lxqt_conf_reset_each "$file_list"

}

run_xfce4_conf_reset_each () {
	run_conf_reset_each "$THE_XFCE_PERCHANNEL_CONF_MAIN_DIR_PATH" "$@"
}

run_xfce4_conf_reset () {
	local file_list="xfce4-keyboard-shortcuts.xml"

	run_xfce4_conf_reset_each "$file_list"

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

	run_lxqt_conf_reset

	run_xfce4_conf_reset

	run_rofi_conf_reset

	run_gtk2_conf_reset

	run_gtk3_conf_reset

	run_fcitx_conf_reset
}

main_conf_reset "$@"
