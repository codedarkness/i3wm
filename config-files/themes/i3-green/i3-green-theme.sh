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
#        FILE: i3-green-theme.sh
#       USAGE: ./i3-green-theme.sh
#
# DESCRIPTION: change colors of i3, i3status and copy other files
#	       to match the color
#
#      AUTHOR: DarknessCode
#       EMAIL: admin@darknesscode.com
#
#     CREATED: 04-25-2020 11:09
#
# -----------------------------------------------------------------

## Setup new color scheme
clear

echo "Changing color scheme for i3 - Green"

echo "------------------------------------------------------------"

## change background color in slick-greeter lightdm
sudo sed -i 's/background-color=.*/background-color=#222D31/g' /etc/lightdm/slick-greeter.conf &&
sudo sed -i 's/theme-name=.*/theme-name=Adapta-Nokto-Eta-Maia/g' /etc/lightdm/slick-greeter.conf &&
sudo sed -i 's/icon-theme-name=.*/icon-theme-name=Adapta-Maia/g' /etc/lightdm/slick-greeter.conf &&
	echo "### ------------------------> Slick-Greeter has been changed"

## copy files to the home
cp -avr config-files/themes/i3-green/config-files/Xresources $HOME/.Xresources &&
	echo "### ------------------------> The new xresources config has been copied"

## copy files and directories to /home/.confi
cp -arv config-files/themes/i3-green/config-files/i3status/ $HOME/.config/ &&
	echo "### ------------------------> The new i3status config has been copied"

## i3 theme colors
sed -i 's/i3-Theme--.*/i3-Theme--Green/g' $HOME/.i3/config

sed -i 's/background\ .*/background\ #222D31/g' $HOME/.i3/config
sed -i 's/statusline\ .*/statusline\ #F9FAF9/g' $HOME/.i3/config

sed -i 's/focused_workspace\  .*\ .*\ .*/focused_workspace\  #222D31\ #222D31\ #1F618D/g' $HOME/.i3/config
sed -i 's/active_workspace\   .*\ .*\ .*/active_workspace\   #222D31\ #222D31\ #FDF6E3/g' $HOME/.i3/config
sed -i 's/inactive_workspace\ .*\ .*\ .*/inactive_workspace\ #222D31\ #222D31\ #EEE8D5/g' $HOME/.i3/config
sed -i 's/binding_mode\       .*\ .*\ .*/binding_mode\       #222D31\ #222D31\ #F9FAF9/g' $HOME/.i3/config
sed -i 's/urgent_workspace\   .*\ .*\ .*/urgent_workspace\   #222D31\ #222D31\ #E5201D/g' $HOME/.i3/config

sed -i 's/client.focused\          .*\ .*\ .*\ .*/client.focused\          #556064\ #556064\ #80FFF9\ #FDF6E3/g' $HOME/.i3/config
sed -i 's/client.focused_inactive\ .*\ .*\ .*\ .*/client.focused_inactive\ #2F3D44\ #2F3D44\ #1ABC9C\ #454948/g' $HOME/.i3/config
sed -i 's/client.unfocused\        .*\ .*\ .*\ .*/client.unfocused\        #2F3D44\ #2F3D44\ #1ABC9C\ #454948/g' $HOME/.i3/config
sed -i 's/client.urgent\           .*\ .*\ .*\ .*/client.urgent\           #CB4B16\ #FDF6E3\ #1ABC9C\ #268BD2/g' $HOME/.i3/config
sed -i 's/client.placeholder\      .*\ .*\ .*\ .*/client.placeholder\      #000000\ #0c0c0c\ #ffffff\ #000000/g' $HOME/.i3/config

sed -i 's/client.background\       .*/client.background\                   #2B2C2B/g' $HOME/.i3/config &&
	echo "### -------------------------> i3 color scheme has been applied"

## change color in dmenurc
sed -i 's/DMENU_NB=.*/DMENU_NB="#222D31"/g' $HOME/.dmenurc
sed -i 's/DMENU_SB=.*/DMENU_SB="#16A085"/g' $HOME/.dmenurc &&
	echo "### -------------------------> dmenu color scheme has been applied"

## change theme and icons in .gtkrc-2.0
sed -i 's/gtk-theme-name=.*/gtk-theme-name="Adapta-Nokto-Eta-Maia"/g' $HOME/.gtkrc-2.0
sed -i 's/gtk-icon-theme-name=.*/gtk-icon-theme-name="Papirus-Adapta-Nokto-Maia"/g' $HOME/.gtkrc-2.0 &&
	echo "### -------------------------> gtkrc has been changed"

## change baclground color dnustrc
sed -i 's/background\ = .*/background\ = \"#222D31"/g' $HOME/.config/dunst/dunstrc &&
	echo "### -------------------------> dnust color scheme has been applied"

## change the background colo in nitrogen
sed -i 's/bgcolor=.*/bgcolor=#222D31/g' $HOME/.config/nitrogen/bg-saved.cfg &&
	echo "### -------------------------> nitrogen color scheme has been applied"

## change kvantum theme
sed -i 's/theme=.*/theme=KvAdaptaDark/g' $HOME/.config/Kvantum/kvantum.kvconfig &&
	echo "### -------------------------> kvantum color scheme has been applied"

echo "------------------------------------------------------------"

while true; do
	read -p "i3 needs to exit to apply all changes [y - n] : " yn
	case $yn in
		[Yy]* ) echo "Closing i3"; i3-msg exit ;;
		[Nn]* ) echo "Don't forget to exit or restart the system."; exit ;;
		* ) echo "Please answer yes or no.";;
	esac
done

