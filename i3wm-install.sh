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

arch-based() {
	config-files/systems/arch-based.sh
}

debian-based() {
	config-files/systems/debian-based.sh
}

config-files() {
	echo ""
	echo " Getting ready custom files for this new installation";
	echo ""
	sleep 2;

	sudo cp config-files/slick-greeter.conf /etc/lightdm/ &&
	echo " slick-greeter custom file has been copied" || echo " Upsss!"
	echo ""

	cp -ar config-files/conky/ $HOME/.config/ &&
	echo " conky has been copied" || echo " Something went wrong!"
	echo ""

	cp -ar config-files/dunst $HOME/.config/ &&
	echo " dunst custom config has been copied" || echo " Holy sssomthing is not good!"
	echo ""

	cp -ar config-files/i3/config $HOME/.i3/config &&
	echo " i3 custom config has been copied" || echo " Upsss!"
	echo ""

	cp -ar config-files/i3status/ $HOME/.config/ &&
	echo " i3status custom config has been copied" || echo " Ok is not you, is the computer"
	echo ""

	cp -ar config-files/dmenurc $HOME/.dmenurc &&
	echo " dmenurc custom config has been copied" || echo " Upsss!"
	echo ""

	cp -ar config-files/gtkrc-2.0 $HOME/.gtkrc-2.0 &&
	echo " gtkrc-2.0 custom config has been copied" || echo " Huston we have a problem!"
	echo ""

	cp -ar config-files/Xresources $HOME/.Xresources &&
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
	echo " 1 - Arch Based"
	echo " 2 - Debian Based"
	echo " 3 - Copy (custom) config files"
	echo " 4 - Keybindings"
	echo " 5 - themes (change colors)"
	echo ""
	echo " 0 - Exit"
	echo ""
	echo -n " Enter selection [1 - 0] : "
	read selection
	echo ""

	case $selection in
		1) clear; arch-based   ;;
		2) clear; debian-based ;;
		3) clear; config-files  ; press_enter ;;
		4) clear; keybindings  ;;
		5) clear; themes       ;;
		0) clear; exit ;;
		*) clear; incorrect_selection ; press_enter ;;
	esac
done
