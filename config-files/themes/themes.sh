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

dark-color() {
	config-files/themes/i3-dark-color.sh
}

dracula-color() {
	config-files/themes/i3-dracula-color.sh
}

green-color() {
	config-files/themes/i3-green-color.sh
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
	echo " DarknessCode"
	echo "  _ ____            _                 "
	echo " (_)___ \          | |                "
	echo "  _  __) | ___ ___ | | ___  _ __ ___  "
	echo " | ||__ < / __/ _ \| |/ _ \| '__/ __| "
	echo " | |___) | (_| (_) | | (_) | |  \__ \ "
	echo " |_|____/ \___\___/|_|\___/|_|  |___/ "
	echo ""
	echo " Colors for i3"
	echo ""
	echo " 1 - Dark Color"
	echo " 2 - Dracula Color"
	echo " 3 - Green Color"
	echo ""
	echo " 0 - Back"
	echo ""
	echo -n " Enter selection [1 - 0] : "
	read selection
	echo ""

	case $selection in
		1) clear; dark-color	  ; press_enter ;;
		2) clear; dracula-color	  ; press_enter ;;
		3) clear; green-color	  ; press_enter ;;
		0) clear; exit ;;
		*) clear; incorrect_selection ; press_enter ;;
	esac
done
