#!/bin/bash
#wget https://github.com/${GitUser}/
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
clear
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
export YLW='\033[0;33m'

echo -e ""
echo -e "   \e[$line┌──────────────────────────────────────────────────────┐\e[m"
echo -e "   \e[$line│                  \e[$box SSH & OpenVPN Menu                 \e[$line│\e[m"
echo -e "   \e[$line└──────────────────────────────────────────────────────┘\e[m"
echo -e "      [\e[$number 01${NC}]${YLW} • Create SSH & OpenVPN Account\e[m"
echo -e "      [\e[$number 02${NC}]${YLW} • Trial Account SSH & OpenVPN\e[m"
echo -e "      [\e[$number 03${NC}]${YLW} • Renew SSH & OpenVPN Account\e[m"
echo -e "      [\e[$number 04${NC}]${YLW} • Delete SSH & OpenVPN Account\e[m"
echo -e "      [\e[$number 05${NC}]${YLW} • Check User Login SSH & OpenVPN\e[m"
echo -e "      [\e[$number 06${NC}]${YLW} • List Member SSH & OpenVPN\e[m"
echo -e "      [\e[$number 07${NC}]${YLW} • Delete User Expired SSH & OpenVPN\e[m"
echo -e "      [\e[$number 08${NC}]${YLW} • Set up Autokill SSH\e[m"
echo -e "      [\e[$number 09${NC}]${YLW} • Cek Users Who Do Multi Login SSH\e[m"
echo -e "      [\e[$number 10${NC}]${YLW} • User List\e[m"
echo -e "      [\e[$number 11${NC}]${YLW} • User Lock\e[m"
echo -e "      [\e[$number 12${NC}]${YLW} • User Unlock\e[m"
echo -e "      [\e[$number 13${NC}]${YLW} • User Password\e[m"
echo -e "      [\e[$number 14${NC}]${YLW} • Restart Service Dropbear, Squid3,\e[m"
echo -e "              ${YLW} OpenVPN & SSH\e[m"
echo -e ""
echo -e "              Press [ x ] To Go Main Menu "
echo -e " "
read -p "       Please Input Number  [1-14 or x] :  "  ssh
echo -e ""
case $ssh in
1)
add-ssh
;;
2)
trial
;;
3)
renew-ssh
;;
4)
del-ssh
;;
5)
cek-ssh
;;
6)
member
;;
7)
delete
;;
8)
autokill
;;
9)
ceklim
;;
10)
user-list
;;
11)
user-lock
;;
12)
user-unlock
;;
13)
user-password
;;
14)
restart
;;
x)
menu
;;
*)
echo "Please enter an correct number"
sleep 1
ssh
;;
esac
