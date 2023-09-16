#!/bin/bash
NC='\e[0m'
DEFBOLD='\e[39;1m'
RB='\e[31;1m'
GB='\e[32;1m'
YB='\e[33;1m'
BB='\e[34;1m'
MB='\e[35;1m'
CB='\e[35;1m'
WB='\e[37;1m'
echo -e "${GB}${WB}[ ${RB}INFO ${WB}]${BB}Auto Backup Enabled Everyday at${CB} 3AM(+08)${NC}      ${GB}${NC} "
echo -e "${GB}${WB}[ ${RB}INFO ${WB}]${BB}Go To this page to check your saved backup file ${NC}https://github.com/Jesanne87/backup${NC}      ${GB}${NC} "
echo ""
read -n 1 -s -r -p "Press any key to back on main menu"
menu