#!/bin/bash
#  ____             _                         ____          _
# |  _ \  __ _ _ __| | ___ __   ___  ___ ___ / ___|___   __| | ___
# | | | |/ _` | '__| |/ / '_ \ / _ \/ __/ __| |   / _ \ / _` |/ _ \
# | |_| | (_| | |  |   <| | | |  __/\__ \__ \ |__| (_) | (_| |  __/
# |____/ \__,_|_|  |_|\_\_| |_|\___||___/___/\____\___/ \__,_|\___|
# -----------------------------------------------------------------
# https://darkncesscode.com
# https://github.com/codedarkness
# -----------------------------------------------------------------
#
#        FILE: i3wm-install.sh
#       USAGE: ./i3wm-install.sh
#
# DESCRIPTION: install i3wm and copy custom config files
#	       this is a minimal configuration of i3
#
#      AUTHOR: DarknessCode
#       EMAIL: admin@darknesscode.com
#
#     CREATED: 05-08-2020
#
# -----------------------------------------------------------------

install-i3wm() {
	config-files/systems/install-i3wm.sh
}

config-files() {
	echo ""
	echo " Getting ready custom files for this new installation";
	echo ""
	sleep 2;

	sudo cp config-files/configs/slick-greeter.conf /etc/lightdm/ &&
	echo " slick-greeter custom file has been copied" || echo " Upsss!"
	echo ""


	## conky directory
	### Check for dir, if not found create it using the mkdir ###
	dldir="$HOME/.config/conky"
	[ ! -d "$dldir" ] && mkdir -p "$dldir" &&
	echo " conky directory was created" || echo "Shhhh! not again"
	echo ""

	cp -af config-files/configs/conky_live $HOME/.config/conky/ &&
	cp -af config-files/configs/conky_shortcuts_i3 $HOME/.config/conky/ &&
	echo " conky has been copied" || echo " conky directory already exist"
	echo ""


	## dunst directory
	### Check for dir, if not found create it using the mkdir ###
	dnustdir="$HOME/.config/dnust/"
	[ ! -d "$dnustdir" ] && mkdir -p "$dnustdir" &&
	echo " dnust directory was created" || echo " dnust directory already exist"
	echo ""

	cp -ar config-files/configs/dunstrc $HOME/.config/dnust/ &&
	echo " dunst custom config has been copied" || echo " Holy sssomthing is not good!"
	echo ""

	cp -ar config-files/configs/i3 $HOME/.i3/config &&
	echo " i3 custom config has been copied" || echo " Upsss!"
	echo ""

	## i3status directory
	### Check for dir, if not found create it using the mkdir ###
	i3sdir="$HOME/.config/i3status"
	[ ! -d "$i3sdir" ] && mkdir -p "$i3sdir" &&
	echo " i3status directory was created" || echo " i3status directory already exist"
	echo ""

	cp -ar config-files/configs/i3status $HOME/.config/i3status/config &&
	echo " i3status custom config has been copied" || echo " Ok is not you, is the computer"
	echo ""

	cp -ar config-files/configs/dmenurc $HOME/.dmenurc &&
	echo " dmenurc custom config has been copied" || echo " Upsss!"
	echo ""

	cp -ar config-files/configs/gtkrc-2.0 $HOME/.gtkrc-2.0 &&
	echo " gtkrc-2.0 custom config has been copied" || echo " Huston we have a problem!"
	echo ""

	cp -ar config-files/configs/Xresources $HOME/.Xresources &&
	echo " Xreoursers has been copied" || echo " Uppssss!"
	echo ""
}

keybindings() {
	less config-files/keybindings
}

themes() {
	config-files/themes/themes.sh
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
	echo " Darknesscode"
	echo "  _ ____                      "
	echo " (_)___ \                     "
	echo "  _  __) |_      ___ __ ___   "
	echo " | ||__ <\ \ /\ / / '_ ' _ \  "
	echo " | |___) |\ V  V /| | | | | | "
	echo " |_|____/  \_/\_/ |_| |_| |_| "
	echo ""
	echo " Improved Tiling Window Manager"
	echo ""
	echo " 1 - Install"
	echo " 2 - Copy (custom) config files"
	echo " 3 - Keybindings"
	echo " 4 - themes (change colors)"
	echo ""
	echo " 0 - Exit"
	echo ""
	echo -n " Enter selection [1 - 0] : "
	read selection
	echo ""

	case $selection in
		1) clear; install-i3wm ;;
		2) clear; config-files  ; press_enter ;;
		3) clear; keybindings  ;;
		4) clear; themes       ;;
		0) clear; exit ;;
		*) clear; incorrect_selection ; press_enter ;;
	esac
done
