#!/bin/bash
###########- COLOR CODE -##############
# // BANNER COLOUR
export banner_colour=$(cat /etc/banner)
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
NC='\e[0m'
DEFBOLD='\e[39;1m'
RB='\e[31;1m'
GB='\e[32;1m'
YB='\e[33;1m'
BB='\e[34;1m'
MB='\e[35;1m'
CB='\e[35;1m'
WB='\e[37;1m'
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^#vls " "/usr/local/etc/xray/vless.json")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
clear
echo -e "\e[$line┌──────────────────────────────────┐\e[m"
echo -e "\e[$line│\e[$box         Check Xray Account       \e[$line│\e[m"
echo -e "\e[$line└──────────────────────────────────┘\e[m"
echo -e "  ${YB}You have no existing clients!${NC}"
echo -e "\e[$line——————————————————————————————————${NC}"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
fi
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^#vxtls " "/usr/local/etc/xray/config.json")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
clear
echo -e "\e[$line┌──────────────────────────────────┐\e[m"
echo -e "\e[$line│\e[$box         Check Xray Account       \e[$line│\e[m"
echo -e "\e[$line└──────────────────────────────────┘\e[m"
echo -e "  ${YB}You have no existing clients!${NC}"
echo -e "\e[$line——————————————————————————————————${NC}"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
fi
clear
echo -e "\e[$line┌──────────────────────────────────┐\e[m"
echo -e "\e[$line│\e[$box         Check Xray Account       \e[$line│\e[m"
echo -e "\e[$line└──────────────────────────────────┘\e[m"
echo -e " ${YB}User                    Expired${NC}  "
echo ""
grep -E "^#vls " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 2-3 | column -t | sort | uniq
grep -E "^#vxtls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2-3 | column -t | sort | uniq
echo ""
echo -e "\e[$line——————————————————————————————————${NC}"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
fi
