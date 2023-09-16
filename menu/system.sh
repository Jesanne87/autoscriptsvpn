#!/bin/bash
#wget https://gJesanne87ithub.com/${GitUser}/
GitUser="Jesanne87"
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
export YLW='\033[0;33m'
clear
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
clear
echo -e ""
echo -e "   \e[$line┌──────────────────────────────────────────────────────┐\e[m"
echo -e "   \e[$line│                     \e[$box SYSTEM MENU\e[30m                     \e[$line│\e[m"
echo -e "   \e[$line└──────────────────────────────────────────────────────┘\e[m"
echo -e "   [\e[$number 01${NC}]\e[$below • Add New Subdomain    ${NC}[\e[$number 08${NC}]\e[$below • LIMIT Speed VPS\e[m"
echo -e "   [\e[$number 02${NC}]\e[$below • Renew Cert Xray Core ${NC}[\e[$number 09${NC}]\e[$below • Restart VPN\e[m"
echo -e "   [\e[$number 03${NC}]\e[$below • Setup DNS NETFLIX    ${NC}[\e[$number 10${NC}]\e[$below • Speedtest Server\e[m"
echo -e "   [\e[$number 04${NC}]\e[$below • Check DNS NETFLIX    ${NC}[\e[$number 11${NC}]\e[$below • Info All Port\e[m"
echo -e "   [\e[$number 05${NC}]\e[$below • Change Password VPS  ${NC}[\e[$number 12${NC}]\e[$below • ON/OF Auto Reboot\e[m"
echo -e "   [\e[$number 06${NC}]\e[$below • Backup Vps           ${NC}[\e[$number 13${NC}]\e[$below • UPDATE SCRIPT\e[m"
echo -e "   [\e[$number 07${NC}]\e[$below • Restore Vps          ${NC}[\e[$number 14${NC}]\e[$below • Clear-Log\e[m"                                                               
echo -e " "
echo -e "              Press [ x ] To Go Main Menu "
echo -e " "
read -p "    Please Input Number  [1-14 or x] :  "  sys
echo -e ""
case $sys in
1)
add-host
;;
2)
certv2ray
;;
3)
dns
;;
4)
nf
;;
5)
passwd
;;
6)
backup
;;
7)
restore
;;
8)
limit-speed
;;
9)
restart
;;
10)
speedtest
;;
11)
info
;;
12)
autoreboot
;;
13)
update
;;
14)
clean-log
;;
x)
menu
;;
*)
echo "Please enter an correct number"
sleep 1
system
;;
esac
