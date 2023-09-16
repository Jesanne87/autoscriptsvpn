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
ssl2="$(cat /etc/stunnel/stunnel.conf | grep -i accept | head -n 2 | cut -d= -f2 | sed 's/ //g' | tr '\n' ' ' | awk '{print $2}')"
wsdropbear="$(cat ~/log-install.txt | grep -w "SSH(HTTP)" | cut -d: -f2|sed 's/ //g')"
wsstunnel="$(cat ~/log-install.txt | grep -w "SSL(HTTPS)" | cut -d: -f2|sed 's/ //g')"
wsovpn="$(cat ~/log-install.txt | grep -w "Websocket OpenVPN" | cut -d: -f2|sed 's/ //g')"
echo -e "\e[$line┌──────────────────────────────────────────────────────┐\e[m"
echo -e "\e[$line│            \e[$box CHANGE PORT WEBSOCKET OPENSSH\e[30m            \e[$line│\e[m"
echo -e "\e[$line└──────────────────────────────────────────────────────┘\e[m"
echo -e "  [\e[$number 01${NC}]\e[$below • Change Port Websocket SSH(HTTP) $wsdropbear\e[m"
echo -e "  [\e[$number 02${NC}]\e[$below • Change Port Websocket SSL(HTTPS) $wsstunnel\e[m"
echo -e "  [\e[$number 03${NC}]\e[$below • Change Port Websocket OpenVPN $wsovpn\e[m"
echo -e ""
echo -e "     [x]  Back To Menu Change Port"
echo -e "     [y]  Go To Main Menu"
echo -e ""
read -p "     Select From Options [1-3 or x & y] :  " prot
echo -e ""
case $prot in
1)
read -p "New Port Websocket SSH(HTTP) : " vpn
if [ -z $vpn ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $vpn)
if [[ -z $cek ]]; then
rm -f /etc/systemd/system/cdn-dropbear.service
cat > /etc/systemd/system/cdn-dropbear.service <<END
[Unit]
Description=Python WS-Dropbear
Documentation=https://kontol.me
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/cdn-dropbear $vpn
Restart=on-failure

[Install]
WantedBy=multi-user.target

END
systemctl daemon-reload
systemctl enable cdn-dropbear
systemctl start cdn-dropbear
systemctl restart cdn-dropbear
sed -i "s/   - Websocket SSH(HTTP)     : $wsdropbear/   - Websocket SSH(HTTP)     : $vpn/g" /root/log-install.txt
echo -e "\e[032;1mPort $vpn modified successfully\e[0m"
else
echo -e "\e[1;31mPort Websocket SSH(HTTP) $vpn is used\e[0m"
fi
;;
2)
read -p "New Port Websocket SSL(HTTPS) : " vpn
if [ -z $vpn ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $vpn)
if [[ -z $cek ]]; then
sed -i "s/$wsstunnel/$vpn/g" /etc/stunnel/stunnel.conf
sed -i "s/   - Stunnel4                : $wsstunnel, $ssl2/   - Stunnel4                : $vpn, $ssl2/g" /root/log-install.txt
sed -i "s/   - Websocket SSL(HTTPS)    : $wsstunnel/   - Websocket SSL(HTTPS)    : $vpn/g" /root/log-install.txt
/etc/init.d/stunnel4 restart > /dev/null
echo -e "\e[032;1mPort $vpn modified successfully\e[0m"
else
echo -e "\e[1;31mPort Websocket SSL(HTTPS) $vpn is used\e[0m"
fi
;;
3)
read -p "New Port Ovpn Websocket: " vpn
if [ -z $vpn ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $vpn)
if [[ -z $cek ]]; then
rm -f /etc/systemd/system/cdn-ovpn.service
cat > /etc/systemd/system/cdn-ovpn.service <<END
[Unit]
Description=Python WS-Ovpn 
Documentation=https://kontol.me
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/cdn-ovpn $vpn
Restart=on-failure

[Install]
WantedBy=multi-user.target

END
systemctl daemon-reload
systemctl enable cdn-ovpn
systemctl start cdn-ovpn
systemctl restart cdn-ovpn
sed -i "s/   - OpenVPN-WS              : $wsovpn/   - OpenVPN-WS              : $vpn/g" /root/log-install.txt
echo -e "\e[032;1mPort $vpn modified successfully\e[0m"
else
echo -e "\e[1;31mPort Ovpn Websocket $vpn is used\e[0m"
fi
;;
x)
clear
change-port
;;
y)
clear
menu
;;
*)
echo "Please enter an correct number"
sleep 1
port-websocket
;;
esac
