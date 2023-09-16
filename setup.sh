#!/bin/bash
#wget https://github.com/${GitUser}/
GitUser="Jesanne87"
GitUser2="msi8888"
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
# ===================
# // License Validating
#clear
#read -p "Input Your License Key : " Input_License_Key
#if [[ $Input_License_Key == "Freedom020223" ]]; then
#    echo -e "Successfull Connected To Server"
#    sleep 1.5
#else
#    echo -e "Your License Key Is Not Valid !"
#    exit 1
#fi
#clear
# Check Register IP
MYIP=$(wget -qO- icanhazip.com/ip);
clear
echo "Checking VPS"
sleep 1
IZIN=$( curl https://raw.githubusercontent.com/msi8888/allow/main/access | grep "$MYIP" )
if [ "$MYIP" = "$IZIN" ]; then
clear
echo -e "${NC}${GB}Permission Accepted...${NC}"
sleep 2
else
clear
echo -e "${NC}${RB}Permission Denied!${NC}";
echo -e "Please Contact ${GB}Admin${NC}"
echo -e "Telegram :t.me/JsPhantom"
rm -r setup.sh
exit 1
fi
clear
secs_to_human() {
    echo "Installation time : $(( ${1} / 3600 )) hours $(( (${1} / 60) % 60 )) minutes $(( ${1} % 60 )) seconds"
}
start=$(date +%s)
echo -e "\e[93mNgopi dlu xD ${NC}"
echo -e "\e[93mJangan Lupa Baca About script no.8 setelah siap Install hehe.. ${NC}"
sleep 3
apt install git curl -y >/dev/null 2>&1
echo -e "\e[32mLoading...\e[0m"
sleep 3
clear
echo -e "${NC}[ ${green}INFO${NC} ] \e[93mPreparing the install file"
echo -e "${NC}[ ${green}INFO${NC} ] \e[93mAlright good ... installation file is ready"
sleep 2
clear
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
clear
mkdir /var/lib/premium-script;
default_email=$( curl https://raw.githubusercontent.com/${GitUser}/email/main/default.conf )
clear
#Nama penyedia script
echo -e "   \e[93mPlease Enter the name of the Script Provider\e[0m"
read -p "   Name : " nm
echo $nm > /root/provided
echo -e ""
#Email domain
echo -e "${ORANGE}════════════════════════════════════════════════════════════\e[0m"
echo -e ""
echo -e "   \e[93mPlease enter your Domain Email/Cloudflare\e[0m"
echo -e "   \e[93m(Press ENTER for default email)\e[0m"
read -p "   Email : " email
default=${default_email}
new_email=$email
if [[ $email == "" ]]; then
sts=$default_email
else
sts=$new_email
fi
# email
mkdir -p /usr/local/etc/xray/
touch /usr/local/etc/xray/email
echo $sts > /usr/local/etc/xray/email
echo ""
echo -e "${ORANGE}════════════════════════════════════════════════════════════\e[0m"
echo ""
echo -e "   \e[93mPlease select a domain type below \e[0m"
echo ""
echo -e "     \e[1;32m1)\e[0m \e[93mEnter your Subdomain\e[0m"
echo -e "     \e[1;32m2)\e[0m \e[93mUse a random Subdomain\e[0m"
echo ""
echo -e "   ${ORANGE}════════════════════════════════════\e[0m"
read -p "   Please select numbers 1-2 or Any Button(Random) : " host
echo ""
if [[ $host == "1" ]]; then
echo -e "   \e[1;32mPlease enter your subdomain "
read -p "   Subdomain: " host1
echo "IP=" >> /var/lib/premium-script/ipvps.conf
echo $host1 > /root/domain
echo ""
elif [[ $host == "2" ]]; then
#install cf
wget https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/install/cf.sh && chmod +x cf.sh && ./cf.sh
rm -f /root/cf.sh
clear
else
echo -e "Random Subdomain/Domain is used"
wget https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/install/cf.sh && chmod +x cf.sh && ./cf.sh
rm -f /root/cf.sh
fi
#read -rp "   Input ur ns-domain : " -e nsdomen
#echo "$nsdomen" > /root/nsdomain
#sleep 1
clear
echo ""
echo -e "\e[0;32mREADY FOR INSTALLATION SCRIPT...\e[0m"
sleep 2
apt install resolvconf network-manager dnsutils bind9 -y
cat > /etc/systemd/resolved.conf << END
[Resolve]
DNS=8.8.8.8 8.8.4.4
Domains=~.
ReadEtcHosts=yes
END

systemctl enable resolvconf
systemctl enable systemd-resolved
systemctl enable NetworkManager
rm -rf /etc/resolv.conf
rm -rf /etc/resolvconf/resolv.conf.d/head
echo "
nameserver 127.0.0.53
" >> /etc/resolv.conf
echo "
" >> /etc/resolvconf/resolv.conf.d/head
systemctl restart resolvconf
systemctl restart systemd-resolved
systemctl restart NetworkManager
echo "Google DNS" > /user/current
sleep 1
#install ssh ovpn
echo -e "\e[0;32mINSTALLING SSH & OVPN...\e[0m"
sleep 1
wget https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/install/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh
echo -e "\e[0;32mDONE INSTALLING SSH & OVPN\e[0m"
clear
#install Xray
echo -e "\e[0;32mINSTALLING XRAY CORE...\e[0m"
sleep 1
wget https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/install/ins-xray.sh && chmod +x ins-xray.sh && screen -S ins-xray ./ins-xray.sh
echo -e "\e[0;32mDONE INSTALLING XRAY CORE\e[0m"
clear
#install ohp-server
echo -e "\e[0;32mINSTALLING OHP PORT...\e[0m"
sleep 1
wget https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/ovpn/ohp.sh && chmod +x ohp.sh && ./ohp.sh
wget https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/ovpn/ohp-dropbear.sh && chmod +x ohp-dropbear.sh && ./ohp-dropbear.sh
wget https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/ovpn/ohp-ssh.sh && chmod +x ohp-ssh.sh && ./ohp-ssh.sh
echo -e "\e[0;32mDONE INSTALLING OHP PORT\e[0m"
clear
#install websocket
echo -e "\e[0;32mINSTALLING WEBSOCKET PORT...\e[0m"
wget https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/websocket-python/websocket.sh && chmod +x websocket.sh && screen -S websocket.sh ./websocket.sh
echo -e "\e[0;32mDONE INSTALLING WEBSOCKET PORT\e[0m"
clear
#finish
rm -f /root/ssh-vpn.sh
rm -f /root/ins-xray.sh
rm -f /root/ohp.sh
rm -f /root/ohp-dropbear.sh
rm -f /root/ohp-ssh.sh
rm -f /root/websocket.sh
# Colour Default
echo "\033[1;37m" > /etc/box
echo "1;31m" > /etc/line
echo "1;32m" > /etc/text
echo "1;33m" > /etc/below
echo "\033[0;37m" > /etc/back
echo "1;35m" > /etc/number
# Version
ver=$( curl https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/version.conf )
history -c
echo "$ver" > /home/ver
clear
echo " "
echo -e  "\e[93mInstallation has been completed!!\e[0m"
echo " "
echo -e "\e[1;32m══════════════════ \e[93mAutoscript PREMIUM\e[1;32m ══════════════════\e[0m" | tee -a log-install.txt
echo ""
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "    [INFORMASI SSH & OpenVPN]" | tee -a log-install.txt
echo "    -------------------------" | tee -a log-install.txt
echo "   - OpenSSH                 : 22"  | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200"  | tee -a log-install.txt
echo "   - OpenVPN SSL             : 110"  | tee -a log-install.txt
echo "   - SlowDNS                 : 5300" | tee -a log-install.txt
echo "   - Stunnel4                : 222, 777"  | tee -a log-install.txt
echo "   - Dropbear                : 143, 109"  | tee -a log-install.txt
echo "   - OHP Dropbear            : 8585"  | tee -a log-install.txt
echo "   - OHP SSH                 : 8686"  | tee -a log-install.txt
echo "   - OHP OpenVPN             : 8787"  | tee -a log-install.txt
echo "   - Websocket SSH(HTTP)     : 80"  | tee -a log-install.txt
echo "   - Websocket SSL(HTTPS)    : 443, 2096"  | tee -a log-install.txt
echo "   - Websocket OpenVPN       : 2097"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "    [INFORMASI Sqd, Bdvp, Ngnx]" | tee -a log-install.txt
echo "    ---------------------------" | tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8000 (limit to IP Server)"  | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 81"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "    [INFORMASI XRAY]"  | tee -a log-install.txt
echo "    ----------------" | tee -a log-install.txt
echo "   - Xray Vmess Ws Tls       : 443"  | tee -a log-install.txt
echo "   - Xray Vless Ws Tls       : 443"  | tee -a log-install.txt
echo "   - Xray Trojan Ws Tls      : 443"  | tee -a log-install.txt
echo "   - Xray Vless Tcp Xtls     : 443"  | tee -a log-install.txt
echo "   - Xray Trojan Tcp Tls     : 443"  | tee -a log-install.txt
echo "   - Xray Vmess Ws None Tls  : 80"  | tee -a log-install.txt
echo "   - Xray Vless Ws None Tls  : 80"  | tee -a log-install.txt
echo "   - Xray Trojan Ws None Tls : 80"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "    [INFORMASI CLASH FOR ANDROID (YAML)]"  | tee -a log-install.txt
echo "    -----------------------------------" | tee -a log-install.txt
echo "   - Xray Vmess Ws Yaml      : Yes"  | tee -a log-install.txt
echo "   - Xray Vless Ws Yaml      : Yes"  | tee -a log-install.txt
echo "   - Xray Trojan Ws Yaml     : Yes"  | tee -a log-install.txt
echo "   --------------------------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Kuala_Lumpur (GMT +8)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 05.00 GMT +8" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""
echo -e "\e[1;32m════════════════ \e[93mAutoscript Moded By JSphantom\e[1;32m ═══════════════\e[0m" | tee -a log-install.txt
sleep 5
echo ""
secs_to_human "$(($(date +%s) - ${start}))" | tee -a log-install.txt
echo ""
echo -e "    \e[1;32m╔══════════════════════════════════════════════════════╗\e[0m"
echo -e "    \e[1;32m║       \e[93m SUCCESFULLY INSTALLED MODED SCRIPT            \e[1;32m║\e[0m"
echo -e "    \e[1;32m║                  \e[93m BY JsPhantom                       \e[1;32m║\e[0m"
echo -e "    \e[1;32m╚══════════════════════════════════════════════════════╝\e[0m"
echo ""
echo ""
echo -e "   \e[93mYour VPS Will Be Automatical Reboot In 5 seconds\e[0m"
rm -r setup.sh
sleep 5
reboot
