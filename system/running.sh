#!/bin/bash
export red="\e[1;31m"
export green="\e[0;32m"
export NC="\e[0m"
echo -e "\e[32mloading...\e[0m"
clear
echo -e "              \e[0;32m[\e[1;36mSYSTEM STATUS INFORMATION\e[0;32m]\e[0m"
echo -e "             \e[0;34m=============================\e[0m"
echo -e ""
echo -e "\e[1;33mSTATUS SSH & OPEN VPN:\e[0m"
echo -e "\e[0;34m-----------------------\e[0m"

status="$(systemctl show ssh.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Open SSH                : "$green"running"$NC" ✓"
else
echo -e " Open SSH                : "$red"not running (Error)"$NC" "
fi

status="$(systemctl show --now openvpn-server@server-tcp-1194 --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " OpenVPN TCP             : "$green"running"$NC" ✓"
else
echo -e " OpenVPN TCP             : "$red"not running (Error)"$NC" "
fi

status="$(systemctl show --now openvpn-server@server-udp-2200 --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " OpenVPN UDP             : "$green"running"$NC" ✓"
else
echo -e " OpenVPN UDP             : "$red"not running (Error)"$NC" "
fi

status="$(systemctl show stunnel4.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Stunnel(SSL)            : "$green"running"$NC" ✓"
else
echo -e " Stunnel(SSL)            : "$red"not running (Error)"$NC" "
fi

status="$(systemctl show dropbear.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " DropBear                : "$green"running"$NC" ✓"
else
echo -e " DropBear                : "$red"not running (Error)"$NC" "
fi

status="$(systemctl show ws-http.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Websocket SSH(HTTP)     : "$green"running"$NC" ✓"
else
echo -e " Websocket SSH(HTTP)     : "$red"not running (Error)"$NC" "
fi

status="$(systemctl show ws-https.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Websocket SSL(HTTPS)    : "$green"running"$NC" ✓"
else
echo -e " Websocket SSL(HTTPS)    : "$red"not running (Error)"$NC" "
fi

status="$(systemctl show ws-ovpn.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Websocket OpenVPN(HTTP) : "$green"running"$NC" ✓"
else
echo -e " Websocket OpenVPN(HTTP) : "$red"not running (Error)"$NC" "
fi

status="$(systemctl show ohps.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " OHP-SSH                 : "$green"running"$NC" ✓"
else
echo -e " OHP-SSH                 : "$red"not running (Error)"$NC" "
fi

status="$(systemctl show ohpd.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " OHP-Dropbear            : "$green"running"$NC" ✓"
else
echo -e " OHP-Dropbear            : "$red"not running (Error)"$NC" "
fi

status="$(systemctl show ohp.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " OHP-OpenVPN             : "$green"running"$NC" ✓"
else
echo -e " OHP-OpenVPN             : "$red"not running (Error)"$NC" "
fi

echo -e ""
echo -e "\e[1;33mSTATUS XRAY:\e[0m"
echo -e "\e[0;34m-------------\e[0m"

status="$(systemctl show xray@none.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Xray Vless Tcp Xtls     : "$green"running"$NC" ✓"
else
echo -e " Xray Vless Tcp Xtls     : "$red"not running (Error)"$NC" "
fi

status="$(systemctl show xray@tcp.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Xray Trojan Tcp tls     : "$green"running"$NC" ✓"
else
echo -e " Xray Trojan Tcp tls     : "$red"not running (Error)"$NC" "
fi

status="$(systemctl show xray@vless.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Xray Vless Ws Tls       : "$green"running"$NC" ✓"
else
echo -e " Xray Vless Ws Tls       : "$red"not running (Error)"$NC" "
fi

status="$(systemctl show xray@vmess.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Xray Vmess Ws Tls       : "$green"running"$NC" ✓"
else
echo -e " Xray Vmess Ws Tls       : "$red"not running (Error)"$NC" "
fi

status="$(systemctl show xray@trojan.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Xray Trojan Ws Tls      : "$green"running"$NC" ✓"
else
echo -e " Xray Trojan Ws Tls      : "$red"not running (Error)"$NC" "
fi

status="$(systemctl show xray@vlessnone.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Xray Vless Ws None      : "$green"running"$NC" ✓"
else
echo -e " Xray Vless Ws None      : "$red"not running (Error)"$NC" "
fi

status="$(systemctl show xray@vmessnone.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Xray Vmess Ws None      : "$green"running"$NC" ✓"
else
echo -e " Xray Vmess Ws None      : "$red"not running (Error)"$NC" "
fi

status="$(systemctl show xray@trojannone.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Xray Trojan Ws None     : "$green"running"$NC" ✓"
else
echo -e " Xray Trojan Ws None     : "$red"not running (Error)"$NC" "
fi

echo -e ""
echo -e "\e[1;33mSTATUS NGINX & SQUID:\e[0m"
echo -e "\e[0;34m--------------------\e[0m"
status="$(systemctl show nginx.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Nginx                   : "$green"running"$NC" ✓"
else
echo -e " Nginx                   : "$red"not running (Error)"$NC" "
fi

status="$(systemctl show squid.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " Squid                   : "$green"running"$NC" ✓"
else
echo -e " Squid                   : "$red"not running (Error)"$NC" "
fi

echo -e "\e[0;34m-----------------------------------------------------------\e[0m"
echo -e ""
echo -e "${green}JIKA TERDAPAT NOT RUNNING, PLEASE REPORT TO ADMIN FOR FIX$NC"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
