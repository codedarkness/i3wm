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
#        FILE: arch-based.sh
#       USAGE: ./arch-based.sh - sub menu (script) of
#              i3wm_install.sh
#
# DESCRIPTION: install i3 and conky
#
#      AUTHOR: DarknessCode
#       EMAIL: admin@darknesscode.com
#
#     CREATED: 05-08-2020 02:20
#
# -----------------------------------------------------------------

i3wm() {
	echo " Installing spectrwm";
	pacman -Qs i3-wm &&
		echo " i3 is installed in your system" ||
		sudo pacman -S --noconfirm --needed i3-wm
}

conky() {
	echo " Installing conky";
	pacman -Qs conky &&
		echo " conky is installed in your system" ||
		sudo pacman -S --noconfirm --needed conky
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
	echo " ###----------- Arch Based System -----------###"
	echo " ## i3wm  --  Tiling Window  Manager for X11  ##"
	echo " -----------------------------------------------"
	echo ""
	echo " 1 - Install i3"
	echo " 2 - Install Conky"
	echo " 0 - Back"
	echo ""
	echo -n " Enter selection [1 - 0] : "
	read selection
	echo ""

	case $selection in
		1) clear; i3wm  ; press_enter ;;
		2) clear; conky ; press_enter ;;
		0) clear; exit ;;
		*) clear; incorrect_selection ; press_enter ;;
	esac
done
