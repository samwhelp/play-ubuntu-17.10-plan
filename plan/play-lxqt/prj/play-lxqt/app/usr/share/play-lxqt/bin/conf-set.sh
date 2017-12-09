#!/usr/bin/env bash


## init
THE_BASE_DIR_PATH=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
source "$THE_BASE_DIR_PATH/_init.sh"


## func

run_conf_set_each () {
	local file_name
	local source_file_path
	local target_file_path
	local source_dir_path="$1"
	shift 1
	local target_dir_path="$1"
	shift 1
	for file_name in $@; do
		source_file_path="$source_dir_path/$file_name"
		target_file_path="$target_dir_path/$file_name"
		cp "$source_file_path" "$target_file_path"
		echo cp "$source_file_path" "$target_file_path"
	done
}

run_lxqt_conf_set_each () {
	run_conf_set_each "$THE_LXQT_CONF_SET_DIR_PATH" "$THE_LXQT_CONF_MAIN_DIR_PATH" "$@"
}

#run_lxqt_conf_set_each () {
#	local file_name
#	local source_file_path
#	local target_file_path
#	local source_dir_path="$THE_LXQT_CONF_SET_DIR_PATH"
#	local target_dir_path="$THE_LXQT_CONF_MAIN_DIR_PATH"
#	for file_name in $@; do
#		source_file_path="$source_dir_path/$file_name"
#		target_file_path="$target_dir_path/$file_name"
#		cp "$source_file_path" "$target_file_path"
#		echo cp "$source_file_path" "$target_file_path"
#	done
#}

run_lxqt_conf_set () {
	local file_list="globalkeyshortcuts.conf lxqt.conf panel.conf session.conf"

	run_lxqt_conf_set_each "$file_list"

}


run_xfce4_conf_set_each () {
	run_conf_set_each "$THE_XFCE_PERCHANNEL_CONF_SET_DIR_PATH" "$THE_XFCE_PERCHANNEL_CONF_MAIN_DIR_PATH" "$@"
}

run_xfce4_conf_set () {
	local file_list="xfce4-keyboard-shortcuts.xml"

	run_xfce4_conf_set_each "$file_list"

}



run_rofi_conf_set () {

	echo cp "$THE_ROFI_CONF_SET_FILE_PATH" "$THE_ROFI_CONF_MAIN_FILE_PATH"

	cp "$THE_ROFI_CONF_SET_FILE_PATH" "$THE_ROFI_CONF_MAIN_FILE_PATH"

	#cat "$THE_ROFI_CONF_MAIN_FILE_PATH"
}

run_gtk2_conf_set () {

	echo cp "$THE_GTK2_CONF_SET_FILE_PATH" "$THE_GTK2_CONF_MAIN_FILE_PATH"

	cp "$THE_GTK2_CONF_SET_FILE_PATH" "$THE_GTK2_CONF_MAIN_FILE_PATH"

	#cat "$THE_GTK2_CONF_MAIN_FILE_PATH"
}

run_gtk3_conf_set () {

	echo cp "$THE_GTK3_CONF_SET_FILE_PATH" "$THE_GTK3_CONF_MAIN_FILE_PATH"

	cp "$THE_GTK3_CONF_SET_FILE_PATH" "$THE_GTK3_CONF_MAIN_FILE_PATH"

	#cat "$THE_GTK3_CONF_MAIN_FILE_PATH"
}

run_fcitx_conf_set () {

	echo cp "$THE_FCITX_CONF_SET_FILE_PATH" "$THE_FCITX_CONF_MAIN_FILE_PATH"

	cp "$THE_FCITX_CONF_SET_FILE_PATH" "$THE_FCITX_CONF_MAIN_FILE_PATH"

	#cat "$THE_FCITX_CONF_MAIN_FILE_PATH"

	im-config -n fcitx

	fcitx-remote -r

}


## main
main_conf_set () {
	xdg_dir_prepare

	run_lxqt_conf_set

	run_xfce4_conf_set

	run_rofi_conf_set

	run_gtk2_conf_set

	run_gtk3_conf_set

	run_fcitx_conf_set
}

main_conf_set "$@"
