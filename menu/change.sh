#!/bin/bash
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
clear
yl='\e[031;1m'
bl='\e[36;1m'
gl='\e[32;1m'
BLUE='\e[0;34m'
clear
echo -e "\e[$line┌──────────────────────────────────────────────────────┐\e[m"
echo -e "\e[$line│                 \e[$box CHANGE PORT MENU\e[30m                    \e[$line│\e[m"
echo -e "\e[$line└──────────────────────────────────────────────────────┘\e[m"
echo -e " [\e[$number 01${NC}]\e[$below • Change Port Stunnel\e[m"
echo -e " [\e[$number 02${NC}]\e[$below • Change Port OpenVPN\e[m"
echo -e " [\e[$number 03${NC}]\e[$below • Change Port OHP SSH\e[m"
echo -e " [\e[$number 04${NC}]\e[$below • Change Port Websocket SSH\e[m"
echo -e " [\e[$number 05${NC}]\e[$below • Change Port Xray Core\e[m"
echo -e " [\e[$number 06${NC}]\e[$below • Change Port Squid Proxy\e[m"
echo -e ""
echo -e "              Press [ x ] To Go Main Menu "
echo -e ""
read -p "     Select From Options [1-8 or x] :  " port
echo -e ""
case $port in
1)
port-ssl
;;
2)
port-ovpn
;;
3)
port-ohp
;;
4)
port-websocket
;;
5)
port-xray
;;
6)
port-squid
;;
x)
clear
menu
;;
*)
echo "Please enter an correct number"
sleep 1
change-port
;;
esac
