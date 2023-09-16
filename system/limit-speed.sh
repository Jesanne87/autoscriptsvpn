#!/bin/bash
# =========================================
# Quick Setup | Script Setup Manager
# Edition : Stable Edition V1.0
# Auther  : JsPhantom
# (C) Copyright 2023
# =========================================
# =========================================
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
###########- END COLOR CODE -##########
red='\e[1;31m'
green='\e[0;32m'
yell='\e[1;33m'
tyblue='\e[1;36m'
purple='\e[0;35m'
NC='\e[0m'
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[ON]${Font_color_suffix}"
Error="${Red_font_prefix}[OFF]${Font_color_suffix}"
cek=$(cat /home/limit)
NIC=$(ip -o $ANU -4 route show to default | awk '{print $5}');
function start () {
clear
echo -e "Limit Speed All Service"
read -p "Set maximum download rate (in Kbps): " down
read -p "Set maximum upload rate (in Kbps): " up
if [[ -z "$down" ]] && [[ -z "$up" ]]; then
echo > /dev/null 2>&1
else
echo "Start Configuration"
sleep 0.5
wondershaper -a $NIC -d $down -u $up > /dev/null 2>&1
systemctl enable --now wondershaper.service
echo "start" > /home/limit
echo "Done"
sleep 1
clear
menu-other
fi
}
function stop () {
clear
wondershaper -ca $NIC
systemctl stop wondershaper.service
echo "Stop Configuration"
sleep 0.5
echo > /home/limit
echo "Done"
sleep 1
clear
menu-other
}
if [[ "$cek" = "start" ]]; then
sts="${Info}"
else
sts="${Error}"
fi
clear
echo -e " \e[$line╔════════════════════════════════════════════╗\033[0m"
echo -e " \e[$line║            ${WH}LIMIT BANDWITH SPEED            \e[$line║ \033[0m"
echo -e " \e[$line╚════════════════════════════════════════════╝\033[0m"
echo ""
echo -e "  STATUS : $sts"
echo ""
echo -e "  [\e[$number 01${NC}]${YLW} • Start Limit\033[0m"
echo -e "  [\e[$number 02${NC}]${YLW} • Stop Limit\033[0m"
echo ""
echo -e "  ${COLOR1}Press [ 0 ] • To Menu System\033[0m"
echo ""
read -rp "  Select menu : " -e num
if [[ "$num" = "1" ]]; then
start
elif [[ "$num" = "2" ]]; then
stop
elif [[ "$num" = "0" ]]; then
system
else
echo " Please Enter The Correct Number!"
sleep 1
limit-speed
fi
