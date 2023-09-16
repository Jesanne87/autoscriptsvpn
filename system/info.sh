#!/bin/bash
#wget https://github.com/${GitUser}/
GitUser="Jesanne87"
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
echo -e "\e[32mloading...\e[0m"
clear
# Color Validation
Lred='\e[1;91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
green='\e[32m'
RED='\033[0;31m'
NC='\033[0m'
BGBLUE='\e[1;44m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0;37m'
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
clear
echo -e "\e[1;32m══════════════════ \e[93mAutoscript PREMIUM\e[1;32m ══════════════════\e[0m"
echo ""
echo "   >>> Service & Port"
echo ""
echo "    [INFORMASI SSH & OpenVPN]"
echo "    -------------------------"
echo "   - OpenSSH                 : 22"
echo "   - OpenVPN                 : TCP 1194, UDP 2200"
echo "   - OpenVPN SSL             : 110"
echo "   - Stunnel4                : 222, 777"
echo "   - Dropbear                : 143, 109"
echo "   - OHP Dropbear            : 8585"
echo "   - OHP SSH                 : 8686"
echo "   - OHP OpenVPN             : 8787"
echo "   - Websocket SSH(HTTP)     : 80"
echo "   - Websocket SSL(HTTPS)    : 443, 2096"
echo "   - Websocket OpenVPN       : 2097"
echo ""
echo "    [INFORMASI Sqd, Bdvp, Ngnx]"
echo "    ---------------------------"
echo "   - Squid Proxy             : 3128, 8000 (limit to IP Server)"
echo "   - Badvpn                  : 7100, 7200, 7300"
echo "   - Nginx                   : 81"
echo "" 
echo "    [INFORMASI XRAY]" 
echo "    ----------------"
echo "   - Xray Vmess Ws Tls       : 443" 
echo "   - Xray Vless Ws Tls       : 443" 
echo "   - Xray Trojan Ws Tls      : 443"  
echo "   - Xray Vless Tcp Xtls     : 443"
echo "   - Xray Trojan Tcp Tls     : 443"
echo "   - Xray Vmess Ws None Tls  : 80"
echo "   - Xray Vless Ws None Tls  : 80"
echo "   - Xray Trojan Ws None Tls : 80"
echo ""  
echo "    [INFORMASI CLASH FOR ANDROID (YAML)]"  
echo "    -----------------------------------"
echo "   - Xray Vmess Ws Yaml      : Yes"
echo "   - Xray Vless Ws Yaml      : Yes"
echo "   - Xray Trojan Ws Yaml     : Yes"
echo "   --------------------------------------------------------------"
echo "" 
echo "   >>> Server Information & Other Features"  
echo "   - Timezone                : Asia/Kuala_Lumpur (GMT +8)"  
echo "   - Fail2Ban                : [ON]" 
echo "   - Dflate                  : [ON]" 
echo "   - IPtables                : [ON]" 
echo "   - Auto-Reboot             : [ON]"
echo "   - IPv6                    : [OFF]"
echo "   - Autoreboot On 05.00 GMT +8" 
echo "   - Autobackup Data"
echo "   - Restore Data"
echo "   - Auto Delete Expired Account"
echo "   - Full Orders For Various Services"
echo "   - White Label"
echo ""
echo -e "\e[1;32m══════════════════ \e[93mAutoscript By JSphantom\e[1;32m ══════════════════\e[0m"
echo ""
read -n1 -r -p "                Press any key to continue..."
    sleep 1
    menu
