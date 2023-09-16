#!/bin/bash
#Script Auto Reboot Vps
#wget https://github.com/${GitUser}/
GitUser="Jesanne87"
clear
# LINE COLOUR
line=$(cat /etc/line)
# TEXT COLOUR BELOW
below=$(cat /etc/below)
# BACKGROUND TEXT COLOUR
back_text=$(cat /etc/back)
# NUMBER COLOUR
number=$(cat /etc/number)
# TEXT ON BOX COLOUR
box=$(cat /etc/box)
RED='\e[1;31m'
GREEN='\e[0;32m'
BLUE='\e[0;34m'
NC='\e[0m'
version=$(cat /home/ver)
ver=$( curl https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/version.conf )
clear
# CEK UPDATE
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info1="${Green_font_prefix}[$version]${Font_color_suffix}"
Info2="${Green_font_prefix}[LATEST VERSION]${Font_color_suffix}"
Error="Version ${Green_font_prefix}[$ver]${Font_color_suffix} available${Red_font_prefix}[Please Update]${Font_color_suffix}"
#Status Version
if [[ $version < $ver ]]; then
sts="${Error}"
else
sts="${Info2}"
fi
clear

# Echo Shell
echo ""
echo -e "\e[$line┌──────────────────────────────────────────────────────┐\e[m"
echo -e "\e[$line│                 \e[$box UPDATE SCRIPT MENU\e[30m                  \e[$line│\e[m"
echo -e "\e[$line└──────────────────────────────────────────────────────┘\e[m"
echo ""
echo -e "\e[$below VERSION NOW >> $Info1"
echo -e "\e[$below STATUS UPDATE >> $sts"
echo -e " [\e[$number 01${NC}]\e[$below • Check Update/New Version Script\e[m"
echo -e ""
echo -e "       Press [ x ] To Go Main Menu "
echo -e ""
read -p "Select From Options [1 or x] :  " port
echo -e ""
case $port in
1)
run-update
;;
x)
clear
system
;;
*)
echo -e "\e[1;31mPlease enter an correct number, Try again.\e[0m"
sleep 1
update
;;
esac
