#!/bin/bash
# =========================================
# Quick Setup | Script Setup Manager
# Edition : Stable Edition V1.0
# Auther  : Geo Project
# (C) Copyright 2023
# =========================================
###########- COLOR CODE -##############
# // TEXT ON BOX COLOUR
export box=$(cat /etc/box)
# // LINE COLOUR
export line=$(cat /etc/line)
# // TEXT COLOUR ON TOP
export text=$(cat /etc/text)
# // TEXT COLOUR BELOW
export below=$(cat /etc/below)
# // BACKGROUND TEXT COLOUR
export back_text=$(cat /etc/back)
# // NUMBER COLOUR
export number=$(cat /etc/number)
###########- END COLOR CODE -##########
clear
echo -e "   \e[$line┌──────────────────────────────────────────────────────┐\e[m"
echo -e "   \e[$line│\e[$box                      XRAY PANEL                      \e[$line│\e[m"
echo -e "   \e[$line└──────────────────────────────────────────────────────┘\e[m"
echo -e "    [\e[$number 01${NC}]\e[$below • Vless Menu\e[m"
echo -e "    [\e[$number 02${NC}]\e[$below • Vmess Menu\e[m"
echo -e "    [\e[$number 03${NC}]\e[$below • Trojan Menu\e[m"
echo -e ""
echo -e "                 Press [ x ] To Go Main Menu "
echo -e ""
echo -ne " ${bold}${GRN}Select menu ${NC}: "; read opt
echo -e ""
case $opt in
01 | 1)vless-menu
;;
02 | 2)vmess-menu
;;
03 | 3)trojaan
;;
x | X)menu
;;
*)
echo -e "\e[1;31mYou Entered The Wrong Number, Please Try Again!\e[0m"
sleep 1
xray-menu
esac