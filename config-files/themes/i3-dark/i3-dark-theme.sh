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
#        FILE: i3-dark-theme.sh
#       USAGE: ./i3-dark-theme.sh
#
# DESCRIPTION: change colors of i3, i3status and copy other files
#              to match the color
#
#      AUTHOR: DarknessCode
#       EMAIL: admin@darknesscode.com
#
#     CREATED: 03-29-2020 01:06
#
# -----------------------------------------------------------------

## Setup new color scheme
clear

echo "Changing color scheme for i3 - Dark"

echo "------------------------------------------------------------"

## change background color in slick-greeter lightdm
sudo sed -i 's/background-color=.*/background-color=#14161B/g' /etc/lightdm/slick-greeter.conf &&
sudo sed -i 's/theme-name=.*/theme-name=Matcha-dark-azul/g' /etc/lightdm/slick-greeter.conf &&
sudo sed -i 's/icon-theme-name=.*/icon-theme-name=Adwaita/g' /etc/lightdm/slick-greeter.conf &&
	echo "### ------------------------> Slick-Greeter has been changed"

## copy files to the home
cp -avr config-files/themes/i3-dark/config-files/Xresources $HOME/.Xresources &&
	echo "### ------------------------> The new xresources config has been copied"

## copy files and directories to /home/.confi
cp -arv config-files/themes/i3-dark/config-files/i3status/ $HOME/.config/ &&
	echo "### ------------------------> The new i3status config has been copied"

## i3 theme colors
sed -i 's/i3-Theme--.*/i3-Theme--Dark/g' $HOME/.i3/config

sed -i 's/background\ .*/background\ #14161B/g' $HOME/.i3/config
sed -i 's/statusline\ .*/statusline\ #C0C0C0/g' $HOME/.i3/config

sed -i 's/focused_workspace\  .*\ .*\ .*/focused_workspace\  #14161B\ #14161B\ #34495E/g' $HOME/.i3/config
sed -i 's/active_workspace\   .*\ .*\ .*/active_workspace\   #14161B\ #14161B\ #808080/g' $HOME/.i3/config
sed -i 's/inactive_workspace\ .*\ .*\ .*/inactive_workspace\ #14161B\ #14161B\ #808080/g' $HOME/.i3/config
sed -i 's/binding_mode\       .*\ .*\ .*/binding_mode\       #14161B\ #14161B\ #F9FAF9/g' $HOME/.i3/config
sed -i 's/urgent_workspace\   .*\ .*\ .*/urgent_workspace\   #14161B\ #14161B\ #E5201D/g' $HOME/.i3/config

sed -i 's/client.focused\          .*\ .*\ .*\ .*/client.focused\          #22252C\ #34495E\ #2B2B2B\ #FDF6E3/g' $HOME/.i3/config
sed -i 's/client.focused_inactive\ .*\ .*\ .*\ .*/client.focused_inactive\ #22252C\ #22252C\ #C0C0C0\ #454948/g' $HOME/.i3/config
sed -i 's/client.unfocused\        .*\ .*\ .*\ .*/client.unfocused\        #22252C\ #22252C\ #C0C0C0\ #454948/g' $HOME/.i3/config
sed -i 's/client.urgent\           .*\ .*\ .*\ .*/client.urgent\           #CB4B16\ #FDF6E3\ #DFDFDF\ #268BD2/g' $HOME/.i3/config
sed -i 's/client.placeholder\      .*\ .*\ .*\ .*/client.placeholder\      #000000\ #0c0c0c\ #ffffff\ #000000/g' $HOME/.i3/config

sed -i 's/client.background\       .*/client.background\                   #1E1F29/g' $HOME/.i3/config &&
	echo "### -------------------------> i3 color scheme has been applied"

## change color in dmenurc
sed -i 's/DMENU_NB=.*/DMENU_NB="#14161B"/g' $HOME/.dmenurc
sed -i 's/DMENU_SB=.*/DMENU_SB="#14161B"/g' $HOME/.dmenurc &&
sed -i 's/DMENU_NF=.*/DMENU_NF="#4D5656"/g' $HOME/.dmenurc &&
	echo "### -------------------------> dmenu color scheme has been applied"

## change theme and icons in .gtkrc-2.0
sed -i 's/gtk-theme-name=.*/gtk-theme-name="Matcha-dark-azul"/g' $HOME/.gtkrc-2.0
sed -i 's/gtk-icon-theme-name=.*/gtk-icon-theme-name="Papirus-Dark"/g' $HOME/.gtkrc-2.0 &&
	echo "### -------------------------> gtkrc has been changed"

## change baclground color dnustrc
sed -i 's/background\ = .*/background\ = \"#14161B"/g' $HOME/.config/dunst/dunstrc &&
	echo "### -------------------------> dnust color scheme has been applied"

## changin the backgroun color for nitrogen
sed -i 's/bgcolor=.*/bgcolor=#14161B/g' $HOME/.config/nitrogen/bg-saved.cfg &&
	echo "### -------------------------> nitrogen background color has been applied"

## change kvantum theme
sed -i 's/theme=.*/theme=KvAdaptaDark/g' $HOME/.config/Kvantum/kvantum.kvconfig &&
	echo "### -------------------------> kvantum theme has been applied"

## dmenu custom
sed -i 's/nb="-nb #.*"/nb="-nb #14161B"/g' ~/Documents/scripts/dmenu-programs.sh &&
sed -i 's/sb="-sb #.*"/sb="-sb #14161B"/g' ~/Documents/scripts/dmenu-programs.sh &&
sed -i 's/nf="-nf #.*"/nf="-nf #D5656"/g' ~/Documents/scripts/dmenu-programs.sh &&
	echo " ### ----> dmenu colors has canged"

echo "------------------------------------------------------------"

while true; do
	read -p "i3 needs to exit to apply all changes [y - n] : " yn
	case $yn in
		[Yy]* ) echo "Closing i3"; i3-msg exit; break ;;
		[Nn]* ) echo "Don't forget to exit or restart the system."; exit ;;
		* ) echo "Please answer yes or no.";;
	esac
done

