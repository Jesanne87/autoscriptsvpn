#!/bin/bash
#wget https://github.com/${GitUser}/
GitUser="Jesanne87"
GitUser2="msi8888"
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
#Domain
domain=$(cat /usr/local/etc/xray/domain)
NS=$(cat /etc/xray/dns)
#ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10)
#CITY=$(curl -s ipinfo.io/city)
#WKT=$(curl -s ipinfo.io/timezone)
IPVPS=$(curl -s ipinfo.io/ip)
cname=$(awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo)
cores=$(awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo)
freq=$(awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo)
tram=$(free -m | awk 'NR==2 {print $2}')
uram=$(free -m | awk 'NR==2 {print $3}')
#fram=$(free -m | awk 'NR==2 {print $4}')
clear
# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"
# USERNAME
#rm -f /usr/bin/user
#username=$(curl https://raw.githubusercontent.com/${GitUser2}/allow/main/ipvps.conf | grep $MYIP | awk '{print $2}')
#echo "$username" >/usr/bin/user
# Order ID
#rm -f /usr/bin/ver
#user=$(curl https://raw.githubusercontent.com/${GitUser2}/allow/main/ipvps.conf | grep $MYIP | awk '{print $3}')
#echo "$user" >/usr/bin/ver
# validity
#rm -f /usr/bin/e
#valid=$(curl https://raw.githubusercontent.com/${GitUser2}/allow/main/ipvps.conf | grep $MYIP | awk '{print $4}')
#echo "$valid" >/usr/bin/e
# DETAIL ORDER
#username=$(cat /usr/bin/user)
#oid=$(cat /usr/bin/ver)
#exp=$(cat /usr/bin/e)
version=$(cat /home/ver)
ver=$( curl https://raw.githubusercontent.com/${GitUser}/version/main/version.conf )
clear
# CEK UPDATE
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info1="${Green_font_prefix}$version${Font_color_suffix}"
Info2="${Green_font_prefix}(Latest Version)${Font_color_suffix}"
Error="Version ${Green_font_prefix}[$ver]${Font_color_suffix} available${Red_font_prefix}[Please Update]${Font_color_suffix}"
#Status Version
if [[ $version < $ver ]]; then
stl="${Error}"
else
stl="${Info2}"
fi
clear
# Getting CPU Information
#cpuUsage=$(top -bn1 | awk '/Cpu/ { print $2}')
#CPU=$(top -bn1 | grep load | awk '{printf "%.2f%%\t\t\n", $(NF-2)}')
#cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
#cpu_usage="$((${cpu_usage1/\.*/} / ${corediilik:-1}))"
#cpu_usage+=" %"
load_cpu=$(printf '%-1s' "$(top -bn1 | awk '/Cpu/ { cpu = "" 100 - $8 "%" }; END { print cpu }')")
#daily_usage=$(vnstat -d --oneline | awk -F\; '{print $6}' | sed 's/ //')
#monthly_usage=$(vnstat -m --oneline | awk -F\; '{print $11}' | sed 's/ //')
#ram_used=$(free -m | grep Mem: | awk '{print $3}')
#total_ram=$(free -m | grep Mem: | awk '{print $2}')
#ram_usage=$(echo "scale=2; ($ram_used / $total_ram) * 100" | bc | cut -d. -f1)
# STATUS EXPIRED ACTIVE
#red_font_prefix="\033[32m" && blue_font_prefix="\033[31m" && blue_background_prefix="\033[42;37m" && Red_background_prefix="\033[4$below" && Font_color_suffix="\033[0m"
#Info="${Green_font_prefix}(Active)${Font_color_suffix}"
#Error="${Green_font_prefix}${Font_color_suffix}${Red_font_prefix}[EXPIRED]${Font_color_suffix}"
#today=$(date -d "0 days" +"%Y-%m-%d")
#Exp1=$(curl https://raw.githubusercontent.com/${GitUser2}/allow/main/ipvps.conf | grep $MYIP | awk '{print $4}')
#if [[ $today < $Exp1 ]]; then
#    sts="${Info}"
#else
#    sts="${Error}"
#fi
#clear
# // Export Color & Information
export WH='\033[1;37m'                   
export RED='\033[0;31m'
export GRN='\033[0;32m'
export YLW='\033[0;33m'
export BLU='\033[0;34m'
export PLE='\033[0;35m'
export CYA='\033[0;36m'
export LHT='\033[0;37m'
export NC='\033[0m'
#Download/Upload today
#dtoday="$(vnstat -i eth0 | grep "today" | awk '{print $2" "substr ($3, 1, 1)}')"
#utoday="$(vnstat -i eth0 | grep "today" | awk '{print $5" "substr ($6, 1, 1)}')"
ttoday="$(vnstat -i eth0 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload yesterday
#dyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $2" "substr ($3, 1, 1)}')"
#uyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $5" "substr ($6, 1, 1)}')"
#tyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload current month
#dmon="$(vnstat -i eth0 -m | grep "$(date +"%b '%y")" | awk '{print $3" "substr ($4, 1, 1)}')"
#umon="$(vnstat -i eth0 -m | grep "$(date +"%b '%y")" | awk '{print $6" "substr ($7, 1, 1)}')"
tmon="$(vnstat -i eth0 -m | grep "$(date +"%b '%y")" | awk '{print $9" "substr ($10, 1, 1)}')"
# CERTIFICATE STATUS
#d1=$(date -d "$valid" +%s)
#d2=$(date -d "$today" +%s)
#certifacate=$(((d1 - d2) / 86400))
# TOTAL ACC CREATE VMESS WS
vmess=$(grep -c -E "^#vms " "/usr/local/etc/xray/vmess.json")
# TOTAL ACC CREATE  VLESS WS
vless=$(grep -c -E "^#vls " "/usr/local/etc/xray/vless.json")
# TOTAL ACC CREATE  VLESS TCP XTLS
xtls=$(grep -c -E "^#vxtls " "/usr/local/etc/xray/config.json")
# TOTAL ACC CREATE  TROJAN
trtls=$(grep -c -E "^#trx " "/usr/local/etc/xray/tcp.json")
# TOTAL ACC CREATE  TROJAN WS TLS
trws=$(grep -c -E "^#trws " "/usr/local/etc/xray/trojan.json")
# TOTAL ACC CREATE OVPN SSH
total_ssh="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
# PROVIDED
creditt=$(cat /root/provided)
# BANNER COLOUR
banner_colour=$(cat /etc/banner)
# TEXT ON BOX COLOUR
box=$(cat /etc/box)
# LINE COLOUR
line=$(cat /etc/line)
# TEXT COLOUR ON TOP
text=$(cat /etc/text)
# TEXT COLOUR BELOW
below=$(cat /etc/below)
# BACKGROUND TEXT COLOUR
back_text=$(cat /etc/back)
# NUMBER COLOUR
number=$(cat /etc/number)

clear
echo -e " \e[$line ┌──────────────────────────────────────────────────────┐${NC}"
echo -e " \e[$line │\e[$box	       ───[ Server Information ]───              \e[$line│${NC}"
echo -e " \e[$line └──────────────────────────────────────────────────────┘${NC}"
echo -e " ${YLW}  OPERATING SYSTEM       : ${NC}$(hostnamectl | grep "Operating System" | cut -d ' ' -f5-)${NC}"
echo -e " ${YLW}  KERNEL	          : ${NC}$(uname -r)${NC}"
echo -e " ${YLW}  SYSTEM UPTIME          : ${NC}$uptime${NC}"
echo -e " ${YLW}  IP ADDRESS		  : ${NC}$IPVPS${NC}"
echo -e " ${YLW}  DOMAIN NAME	          : ${PLE}$domain${NC}"
echo -e " ${YLW}  NS NAME	              : ${PLE}$NS${NC}"
echo -e " ${YLW}  PROVIDED BY		  : ${YLW}$creditt${NC}"
echo -e " ${YLW}  EXPIRED STATUS         : ${NC}Lifetime(Free)${NC}"
echo -e " ${YLW}  SCRIPT VERSION	  : ${NC}$stl${NC}"
echo -e " ${YLW}  CPU USAGE		  : ${NC}$load_cpu${NC}"
echo -e " ${YLW}  MEMORY USAGE           : ${NC}$uram MB/$tram MB${NC}"
echo -e " ${YLW}  BANDWIDTH DATA USAGE	  : ${WH}$ttoday Daily/ ${YLW}$tmon Monthly${NC}"
echo -e " \e[$line ┌──────────────────────────────────────────────────────┐${NC}"
echo -e "   ${WH}Ssh/Ovpn  Vmess  Vless  Vlessxtls   Troj-Ws   Troj-Tls${NC}"
echo -e "      ${GRN} $total_ssh       $vmess      $vless        $xtls          $trws         $trtls${NC}"
echo -e " \e[$line └──────────────────────────────────────────────────────┘${NC}"	
echo -e " \e[$line ┌──────────────────────────────────────────────────────┐${NC}"
echo -e " \e[$line │\e[$box               ───[ SERVER MENU ]───                  \e[$line│${NC}"
echo -e " \e[$line └──────────────────────────────────────────────────────┘${NC}"
echo -e "  "
echo -e "    [\e[$number 01${NC}]${YLW} • Xray Menu ${NC}             [\e[$number 07${NC}]${YLW} • Themes ${NC}"
echo -e "    [\e[$number 02${NC}]${YLW} • SSH & OPENVPN ${NC}         [\e[$number 08${NC}]${YLW} • Change Port ${NC}"
echo -e "    [\e[$number 03${NC}]${YLW} • System Menu  ${NC}          [\e[$number 09${NC}]${YLW} • About Script ${NC}"
echo -e "    [\e[$number 04${NC}]${YLW} • Check Running ${NC}         [\e[$number 10${NC}]${YLW} • RAM Cleaner ${NC}"
echo -e "    [\e[$number 05${NC}]${YLW} • Reboot  ${NC}               [\e[$number 11${NC}]${YLW} • XRAY Bandwidth${NC}"
echo -e "    [\e[$number 06${NC}]${YLW} • Xray Id Check  ${NC}"             
echo -e " "
echo -e " \e[$line ┌──────────────────────────────────────────────────────┐${NC}"
echo -e " \e[$line │\e[$box   •••───[ Moded Script By JsPhantom @ 2023 ]───•••   \e[$line│${NC}"
echo -e " \e[$line └──────────────────────────────────────────────────────┘${NC}"
echo -e "                [Ctrl + C] Exit From Script"
echo -e " "
read -p " Select menu :  " menu
echo -e " "
case $menu in
1 | 01 )
    xray-menu
    ;;
2 | 02 )
    ssh
    ;;
3 | 03 )
    system
    ;;
4 | 04 )
    check-sc
    ;;
5 | 05)
    reboot
    ;;
6 | 06 )
    xrayacc
    ;;    
7 | 07 )
    themes
    ;;
8 | 08 )
    change-port
    ;;
9 | 09 )
    about
    ;;
10 )
    clean-ram
    ;;
11 )
    traffic
    ;;    
*)
    echo -e "\e[1;31mPlease enter an correct number\e[0m"
    sleep 1
    menu
    ;;
esac
