#!/bin/bash
#  ____             _                         ____          _
# |  _ \  __ _ _ __| | ___ __   ___  ___ ___ / ___|___   __| | ___
# | | | |/ _' | '__| |/ / '_ \ / _ \/ __/ __| |   / _ \ / _' |/ _ \
# | |_| | (_| | |  |   <| | | |  __/\__ \__ \ |__| (_) | (_| |  __/
# |____/ \__,_|_|  |_|\_\_| |_|\___||___/___/\____\___/ \__,_|\___|
# -----------------------------------------------------------------
# https://darkncesscode.com
# https://github.com/codedarkness
# -----------------------------------------------------------------
#
#        FILE: themes.sh
#       USAGE: ./themes.sh - sub menu (script) of
#              i3wm_install.sh
#
# DESCRIPTION: change the color of i3 colors
#
#      AUTHOR: DarknessCode
#       EMAIL: admin@darknesscode.com
#
#     CREATED: 05-08-2020 05:08
#
# -----------------------------------------------------------------

brown-theme() {
	config-files/themes/i3-brown/i3-brown-theme.sh
}

dark-blue-theme() {
	config-files/themes/i3-dark-blue/i3-dark-blue-theme.sh
}

dark-theme() {
	config-files/themes/i3-dark/i3-dark-theme.sh
}

dracula-theme() {
	config-files/themes/i3-dracula/i3-dracula-theme.sh
}

gray-theme() {
	config-files/themes/i3-gray/i3-gray-theme.sh
}

green-theme() {
	config-files/themes/i3-green/i3-green-theme.sh
}

press_enter() {
	echo ""
	echo -n " Press Enter To Continue"
	read
	clear
}

incorrect_selection() {
	echo " Incorrect selection! try again"
}

until [ "$selection" = "0" ]; do
	clear
	echo ""
	echo " -----------------------------------------------"
	echo " ###-----------   Color  Themes   -----------###"
	echo " ##--- i3wm tiling window manager for X11 --- ##"
	echo " -----------------------------------------------"
	echo ""
	echo " 1 - Brown Color Scheme"
	echo " 2 - Dark Blue Color Scheme"
	echo " 3 - Dark Color Scheme"
	echo " 4 - Dracula Color Scheme"
	echo " 5 - Gray Color Scheme"
	echo " 6 - Green Color Scheme"
	echo " 0 - Back"
	echo ""
	echo -n " Enter selection [1 - 0] : "
	read selection
	echo ""

	case $selection in
		1) clear; browm-theme	  ; press_enter ;;
		2) clear; dark-blue-theme ; press_enter ;;
		3) clear; dark-theme	  ; press_enter ;;
		4) clear; dracula-theme	  ; press_enter ;;
		5) clear; gray-theme	  ; press_enter ;;
		6) clear; green-theme	  ; press_enter ;;
		0) clear; exit ;;
		*) clear; incorrect_selection ; press_enter ;;
	esac
done