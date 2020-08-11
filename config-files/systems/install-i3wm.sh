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
#        FILE: install-i3wm.sh
#       USAGE: ./install-i3wm.sh | sub menu of i3wm-install.sh
#
# DESCRIPTION: install i3 in Arch and Debian Based Systems
#
#      AUTHOR: DarknessCode
#       EMAIL: admin@darknesscode.com
#
#     CREATED: 08-11-20 12:44
#
# -----------------------------------------------------------------

install-i3wm() {
	echo ""
	echo " Install i3 in Arch and Debian Based Systems"
	echo ""
	sleep 2

	while true; do
		read -p " Install i3 [y - n] : " yn
		case $yn in
			[Yy]* )
				if ! location="$(type -p "i3")" || [ -z "i3" ]; then

					# check if pacman is installed
					if which pacman > /dev/null; then

						sudo pacman -S --noconfirm i3-gaps

					# check if apt is installed
					elif which apt > /dev/null; then

						sudo apt install -y i3

					else

						echo " Your system is not Arch or Debian Based System"
					fi

					else
						echo " Nothing to do! i3 is installed in your System"
				fi ; break ;;
			[Nn]* )
				break ;;
			* ) echo "Please answer yes or no." ;;
		esac
	done
}

install-conky() {
	echo ""
	echo " Install Conky in Arch and Debian Based Systems"
	echo ""
	sleep 2

	while true; do
		read -p " Install Conky [y - n] : " yn
		case $yn in
			[Yy]* )
				if ! location="$(type -p "conky")" || [ -z "conky" ]; then

					# check if pacman is installed
					if which pacman > /dev/null; then

						sudo pacman -S --noconfirm conky

					# check if apt is installed
					elif which apt > /dev/null; then

						sudo apt install -y conky

					else

						echo " Your system is not Arch or Debian Based System"
					fi

					else
						echo " Nothing to do! conky is installed in your System"
				fi ; break ;;
			[Nn]* )
				break ;;
			* ) echo "Please answer yes or no." ;;
		esac
	done
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
	echo "  _           _        _ _ _ ____   "
	echo " (_)         | |      | | (_)___ \  "
	echo "  _ _ __  ___| |_ __ _| | |_  __) | "
	echo " | | '_ \/ __| __/ _' | | | ||__ <  "
	echo " | | | | \__ \ || (_| | | | |___) | "
	echo " |_|_| |_|___/\__\__,_|_|_|_|____/  "
	echo ""
	echo " Install i3 in arch and debian based systems"
	echo ""
	echo " 1 - Install i3"
	echo " 2 - Install Conky"
	echo ""
	echo " 0 - Back"
	echo ""
	echo -n " Enter selection [1 - 0] : "
	read selection
	echo ""

	case $selection in
		1) clear; install-i3wm  ; press_enter ;;
		2) clear; install-conky ; press_enter ;;
		0) clear; exit ;;
		*) clear; incorrect_selection ; press_enter ;;
	esac
done
