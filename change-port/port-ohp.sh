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
ohpssh="$(cat ~/log-install.txt | grep -w "OHP SSH" | cut -d: -f2|sed 's/ //g')"
ohpdrop="$(cat ~/log-install.txt | grep -w "OHP Dropbear" | cut -d: -f2|sed 's/ //g')"
echo -e "\e[$line┌──────────────────────────────────────────────────────┐\e[m"
echo -e "\e[$line│              \e[$box CHANGE PORT OHP OPENSSH\e[30m                \e[$line│\e[m"
echo -e "\e[$line└──────────────────────────────────────────────────────┘\e[m"
echo -e "  [\e[$number 01${NC}]\e[$below • Change Port OHP SSH $ohpssh\e[m"
echo -e "  [\e[$number 02${NC}]\e[$below • Change Port OHP Dropbear $ohpdrop\e[m"
echo -e ""
echo -e "     [x]  Back To Menu Change Port"
echo -e "     [y]  Go To Main Menu"
echo -e ""
read -p "     Select From Options [1-2 or x & y] :  " prot
echo -e ""
case $prot in
1)
read -p "New Port OHP SSH: " vpn
if [ -z $vpn ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $vpn)
if [[ -z $cek ]]; then
rm -f /etc/systemd/system/ohps.service
cat > /etc/systemd/system/ohps.service <<END
[Unit]
Description=Direct Squid Proxy For open-ssh
Documentation=https://t.me/meaaoouuuu
Wants=network.target
After=network.target

[Service]
ExecStart=/usr/local/bin/ohps -port $vpn -proxy 127.0.0.1:3128 -tunnel 127.0.0.1:22
Restart=always
RestartSec=3

[Install]
WantedBy=multi-user.target
END
systemctl daemon-reload
systemctl enable ohps
systemctl restart ohps
sed -i "s/   - OHP SSH                 : $ohpssh/   - OHP SSH                 : $vpn/g" /root/log-install.txt
echo -e "\e[032;1mPort $vpn modified successfully\e[0m"
else
echo -e "\e[1;31mPort OHP SSH $vpn is used\e[0m"
fi
;;
2)
read -p "New Port OHP Dropbear: " vpn
if [ -z $vpn ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $vpn)
if [[ -z $cek ]]; then
rm -f /etc/systemd/system/ohpd.service
cat > /etc/systemd/system/ohpd.service <<END
[Unit]
Description=Direct Squid Proxy For Dropbear 
Documentation=https://t.me/meaaoouuuu
Wants=network.target
After=network.target

[Service]
ExecStart=/usr/local/bin/ohpd -port $vpn -proxy 127.0.0.1:3128 -tunnel 127.0.0.1:109
Restart=always
RestartSec=3

[Install]
WantedBy=multi-user.target
END
systemctl daemon-reload
systemctl enable ohpd
systemctl restart ohpd
sed -i "s/   - OHP Dropbear            : $ohpdrop/   - OHP Dropbear            : $vpn/g" /root/log-install.txt
echo -e "\e[032;1mPort $vpn modified successfully\e[0m"
else
echo -e "\e[1;31mPort OHP Dropbear $vpn is used\e[0m"
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
port-ohp
;;
esac
