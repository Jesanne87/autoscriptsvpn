#!/bin/bash
GitUser="Jesanne87"
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
# // IZIN SCRIPT
export MYIP=$(curl -sS ipv4.icanhazip.com)
# // PROVIDED
clear
source /var/lib/premium-script/ipvps.conf
export creditt=$(cat /root/provided)
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
# // TOTAL ACC CREATE VMESS WS
export total1=$(grep -c -E "^#vms " "/usr/local/etc/xray/vmess.json")
# // TOTAL ACC CREATE  VLESS WS
export total2=$(grep -c -E "^#vls " "/usr/local/etc/xray/vless.json")
# // TOTAL ACC CREATE  VLESS TCP XTLS
export total3=$(grep -c -E "^#vxtls " "/usr/local/etc/xray/config.json")
if [[ "$IP" = "" ]]; then
     domain=$(cat /usr/local/etc/xray/domain)
else
     domain=$IP
fi

# ADD USER VLESS WS
function menu7 () {
clear
MYIP=$(wget -qO- ipv4.icanhazip.com)
tls="$(cat ~/log-install.txt | grep -w "Vless Ws Tls" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vless Ws None Tls" | cut -d: -f2|sed 's/ //g')"
echo -e "\e[$line┌──────────────────────────────────────────────────────┐\e[m"
echo -e "\e[$line│            \e[$box CREATE USER XRAY VLESS WS TLS           \e[$line │ \e[m"
echo -e "\e[$line└──────────────────────────────────────────────────────┘\e[m"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Username: " -e user
		CLIENT_EXISTS=$(grep -w $user /usr/local/etc/xray/vless.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
export patchtls=/kontol-vlesswstls
export patchnontls=/kontol-vlesswsntls
export uuid=$(cat /proc/sys/kernel/random/uuid)

read -p "Bug Address (Example: www.google.com) : " address
read -p "Bug SNI/Host (Example : m.facebook.com) : " sni
read -p "Expired (days) : " masaaktif

bug_addr=${address}.
bug_addr2=$address
if [[ $address == "" ]]; then
sts=$bug_addr2
else
sts=$bug_addr
fi

export exp=`date -d "$masaaktif days" +"%d-%m-%Y"`
export harini=`date -d "0 days" +"%d-%m-%Y"`

sed -i '/#xray-vless-tls$/a\#vls '"$user $exp $harini $uuid"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/vless.json
sed -i '/#xray-vless-nontls$/a\#vls '"$user $exp $harini $uuid"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/vlessnone.json

export vlesslink1="vless://${uuid}@${sts}${domain}:$tls?path=$patchtls&security=tls&encryption=none&host=${domain}&type=ws&sni=$sni#${user}$exp"
export vlesslink2="vless://${uuid}@${sts}${domain}:$none?path=$patchnontls&encryption=none&host=$sni&type=ws#${user}$exp"
export vlesslink3="vless://${uuid}@${sts}${domain}:$none?path=$patchnontls&encryption=none&host=maingame.com.my&type=ws#${user}$exp"
export vlesslink4="vless://${uuid}@${sts}${MYIP}:$none?path=$patchnontls&encryption=none&host=maingame.com.my&type=ws#${user}$exp"
export vlesslink5="vless://${uuid}@${sts}www.speedtest.net:$none?path=$patchnontls&encryption=none&host=${domain}&type=ws#${user}$exp"
export vlesslink6="vless://${uuid}@${sts}help.viu.com:$none?path=$patchnontls&encryption=none&host=${domain}&type=ws#${user}$exp"
export vlesslink7="vless://${uuid}@${sts}${domain}:$tls?path=$patchtls&security=tls&encryption=none&host=playtv.unifi.com.my&type=ws&sni=playtv.unifi.com.my#${user}$exp"
export vlesslink8="vless://${uuid}@${sts}yes.hate-me.eu.org:$none?path=$patchnontls&encryption=none&host=cdn.who.int.${domain}&type=ws#${user}$exp"
export vlesslink9="vless://${uuid}@${sts}162.159.134.61:$none?path=$patchnontls&encryption=none&host=${domain}&type=ws#${user}$exp"
export vlesslink10="vless://${uuid}@${sts}api.useinsider.com:$none?path=$patchnontls&encryption=none&host=${domain}&type=ws#${user}$exp"
export vlesslink11="vless://${uuid}@${sts}${domain}:$tls?path=$patchtls&security=tls&encryption=none&host=${domain}&type=ws&sni=sso.pokemon.com&host#${user}$exp"
export vlesslink12="vless://${uuid}@${sts}m.google.com.my.${domain}:$none?path=$patchnontls&encryption=none&host=api.instagram.com&type=ws#${user}$exp"
export vlesslink13="vless://${uuid}@${sts}${domain}:$tls?path=$patchtls&security=tls&encryption=none&host=esports.pubgmobile.com.esports.mobilelegends.com&type=ws&sni=esports.pubgmobile.com.esports.mobilelegends.com#${user}$exp"


systemctl restart xray@vless
systemctl restart xray@vlessnone

clear
echo -e ""
echo -e "\e[$line┌──────────────────────────────────────────────────────┐\e[m"
echo -e "\e[$line│                   \e[$box XRAY VLESS WS                    \e[$line │ \e[m"
echo -e "\e[$line└──────────────────────────────────────────────────────┘\e[m"
echo -e "Remarks          : ${user}"
echo -e "Domain           : ${domain}"
echo -e "IP/Host          : $MYIP"
echo -e "Port TLS         : $tls"
echo -e "Port None TLS    : $none"
echo -e "User ID          : ${uuid}"
echo -e "Encryption       : None"
echo -e "Network          : WebSocket"
echo -e "Path Tls         : $patchtls"
echo -e "Path None Tls    : $patchnontls"
echo -e "allowInsecure    : True/allow"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link TLS         : ${vlesslink1}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link None TLS    : ${vlesslink2}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link ${YLW}UMOBILE${NC}     : ${vlesslink3}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link ${YLW}UMOBILE ALL${NC} : ${vlesslink4}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link ${BLU}2 In One${NC}    : ${vlesslink5}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link ${RED}MAXISTV${NC}     : ${vlesslink6}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link ${YLW}UNIFI${NC}       : ${vlesslink7}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link ${PLE}YES4g/5g${NC}    : ${vlesslink8}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link ${YLW}DiGi3Mb${NC}     : ${vlesslink9}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link ${YLW}DiGiAPN${NC}     : ${vlesslink10}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link ${YLW}DiGi Poke${NC}   : ${vlesslink11}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link ${YLW}DiGi Sosial${NC} : ${vlesslink12}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link ${YLW}Yodoo Add On${NC}: ${vlesslink13}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "\e[$line TLS QRcode\e[m"
qrencode -t ansiutf8 "vless://${uuid}@${sts}${domain}:$tls?path=$patchtls&security=tls&encryption=none&host=${domain}&type=ws&sni=$sni#${user}"
echo -e "\e[$line NTLS QRcode\e[m"
qrencode -t ansiutf8 "vless://${uuid}@${sts}${domain}:$none?path=$patchnontls&encryption=none&host=$sni&type=ws#${user}" 
echo ""
echo -e "Created   : $harini"
echo -e "Expired   : $exp"
echo ""
read -n 1 -s -r -p "Press any key to back on menu xray"
vless-menu
}

# TRIAL USER VLESS WS
function menu8 () {
clear
MYIP=$(wget -qO- ipv4.icanhazip.com)
tls="$(cat ~/log-install.txt | grep -w "Vless Ws Tls" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vless Ws None Tls" | cut -d: -f2|sed 's/ //g')"
echo -e "\e[$line┌──────────────────────────────────────────────────────┐\e[m"
echo -e "\e[$line│           \e[$box TRIAL USER XRAY VLESS WS TLS             \e[$line │ \e[m"
echo -e "\e[$line└──────────────────────────────────────────────────────┘\e[m"

# // Create Expried 
export masaaktif="1"
export exp=$(date -d "$masaaktif days" +%d-%m-%Y")

# Make Random Username 
export user=Trial`</dev/urandom tr -dc X-Z0-9 | head -c4`

export patchtls=/kontol-vlesswstls
export patchnontls=/kontol-vlesswsntls
export uuid=$(cat /proc/sys/kernel/random/uuid)

read -p "Bug Address (Example: www.google.com) : " address
read -p "Bug SNI/Host (Example : m.facebook.com) : " sni

bug_addr=${address}.
bug_addr2=$address
if [[ $address == "" ]]; then
sts=$bug_addr2
else
sts=$bug_addr
fi

export harini=`date -d "0 days" +%d-%m-%Y"`

sed -i '/#xray-vless-tls$/a\#vls '"$user $exp $harini $uuid"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/vless.json
sed -i '/#xray-vless-nontls$/a\#vls '"$user $exp $harini $uuid"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/vlessnone.json

export vlesslink1="vless://${uuid}@${sts}${domain}:$tls?path=$patchtls&security=tls&encryption=none&host=${domain}&sni=$sni&type=ws#${user}$exp"
export vlesslink2="vless://${uuid}@${sts}${domain}:$none?path=$patchnontls&encryption=none&host=$sni&type=ws#${user}$exp"
export vlesslink3="vless://${uuid}@${sts}${domain}:$none?path=$patchnontls&encryption=none&host=maingame.com.my&type=ws#${user}$exp"
export vlesslink4="vless://${uuid}@${sts}${MYIP}:$none?path=$patchnontls&encryption=none&host=maingame.com.my&type=ws#${user}$exp"
export vlesslink5="vless://${uuid}@${sts}www.speedtest.net:$none?path=$patchnontls&encryption=none&host=${domain}&type=ws#${user}$exp"
export vlesslink6="vless://${uuid}@${sts}help.viu.com:$none?path=$patchnontls&encryption=none&host=${domain}&type=ws#${user}$exp"
export vlesslink7="vless://${uuid}@${sts}${domain}:$tls?path=$patchtls&security=tls&encryption=none&host=playtv.unifi.com.my&type=ws&sni=playtv.unifi.com.my#${user}$exp"
export vlesslink8="vless://${uuid}@${sts}yes.hate-me.eu.org:$none?path=$patchnontls&encryption=none&host=cdn.who.int.${domain}&type=ws#${user}$exp"
export vlesslink9="vless://${uuid}@${sts}162.159.134.61:$none?path=$patchnontls&encryption=none&host=${domain}&type=ws#${user}$exp"
export vlesslink10="vless://${uuid}@${sts}api.useinsider.com:$none?path=$patchnontls&encryption=none&host=${domain}&type=ws#${user}$exp"
export vlesslink11="vless://${uuid}@${sts}${domain}:$tls?path=$patchtls&security=tls&encryption=none&host=${domain}&type=ws&sni=sso.pokemon.com&host#${user}$exp"
export vlesslink12="vless://${uuid}@${sts}m.google.com.my.${domain}:$none?path=$patchnontls&encryption=none&host=api.instagram.com&type=ws#${user}$exp"
export vlesslink13="vless://${uuid}@${sts}${domain}:$tls?path=$patchtls&security=tls&encryption=none&host=esports.pubgmobile.com.esports.mobilelegends.com&type=ws&sni=esports.pubgmobile.com.esports.mobilelegends.com#${user}$exp"

systemctl restart xray@vless
systemctl restart xray@vlessnone

clear
echo -e ""
echo -e "\e[$line┌──────────────────────────────────────────────────────┐\e[m"
echo -e "\e[$line│                \e[$box TRIAL XRAY VLESS WS                 \e[$line │ \e[m"
echo -e "\e[$line└──────────────────────────────────────────────────────┘\e[m"
echo -e "Remarks          : ${user}"
echo -e "Domain           : ${domain}"
echo -e "IP/Host          : $MYIP"
echo -e "Port TLS         : $tls"
echo -e "Port None TLS    : $none"
echo -e "User ID          : ${uuid}"
echo -e "Encryption       : None"
echo -e "Network          : WebSocket"
echo -e "Path Tls         : $patchtls"
echo -e "Path None Tls    : $patchnontls"
echo -e "allowInsecure    : True/allow"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link TLS         : ${vlesslink1}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link None TLS    : ${vlesslink2}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link ${YLW}UMOBILE${NC}     : ${vlesslink3}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link ${YLW}UMOBILE ALL${NC} : ${vlesslink4}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link ${BLU}2 In One${NC}    : ${vlesslink5}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link ${RED}MAXISTV${NC}     : ${vlesslink6}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link ${YLW}UNIFI${NC}       : ${vlesslink7}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link ${PLE}YES4g/5g${NC}    : ${vlesslink8}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link ${YLW}DiGi3Mb${NC}     : ${vlesslink9}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link ${YLW}DiGiAPN${NC}     : ${vlesslink10}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link ${YLW}DiGi Poke${NC}   : ${vlesslink11}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link ${YLW}DiGi Sosial${NC} : ${vlesslink12}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link ${YLW}Yodoo Add On${NC}: ${vlesslink13}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "\e[$line TLS QRcode\e[m"
qrencode -t ansiutf8 "vless://${uuid}@${sts}${domain}:$tls?path=$patchtls&security=tls&encryption=none&host=${domain}&sni=$sni&type=ws#${user}"
echo -e "\e[$line NTLS QRcode\e[m"
qrencode -t ansiutf8 "vless://${uuid}@${sts}${domain}:$none?path=$patchnontls&encryption=none&host=$sni&type=ws#${user}" 
echo ""
echo -e "Created   : $harini"
echo -e "Expired   : $exp"
echo ""
read -n 1 -s -r -p "Press any key to back on menu xray"
vless-menu
}

# DELETE USER VLESS WS
function menu9 () {
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^#vls " "/usr/local/etc/xray/vless.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo "You have no existing clients!"
    echo ""
    read -n 1 -s -r -p "Press any key to back on menu xray"
vless-menu
	fi

	clear
	echo " Delete User Xray Vless Ws"
	echo " Select the existing client you want to remove"
	echo " Press CTRL+C to return"
	echo " •───────────────────────────────•"
	echo "     No  Expired   User"
	grep -E "^#vls " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
export harini=$(grep -E "^#vls " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
export uuid=$(grep -E "^#vls " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
export user=$(grep -E "^#vls " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
export exp=$(grep -E "^#vls " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)

sed -i "/^#vls $user $exp $harini $uuid/,/^},{/d" /usr/local/etc/xray/vless.json
sed -i "/^#vls $user $exp $harini $uuid/,/^},{/d" /usr/local/etc/xray/vlessnone.json

systemctl restart xray@vless
systemctl restart xray@vlessnone

clear
echo " Xray Vless Ws Account Deleted Successfully"
echo " •───────────────────────────────•"
echo " Client Name : $user"
echo " Expired On  : $exp"
echo " •───────────────────────────────•"
echo ""
read -n 1 -s -r -p "Press any key to back on menu xray"
vless-menu
}

#RENEW VLESS WS
function menu10 () {
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^#vls " "/usr/local/etc/xray/vless.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo "You have no existing clients!"
    echo ""
    read -n 1 -s -r -p "Press any key to back on menu xray"
vless-menu
	fi

	clear
	echo "Renew User Xray Vless Ws"
	echo "Select the existing client you want to renew"
	echo " Press CTRL+C to return"
	echo -e "•───────────────────────────────•"
	grep -E "^#vls " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
read -p "Expired (days): " masaaktif
export harini=$(grep -E "^#vls " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
export uuid=$(grep -E "^#vls " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
export user=$(grep -E "^#vls " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
export exp=$(grep -E "^#vls " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
export now=$(date +%d-%m-%Y")
export d1=$(date -d "$exp" +%s)
export d2=$(date -d "$now" +%s)
export exp2=$(( (d1 - d2) / 86400 ))
export exp3=$(($exp2 + $masaaktif))
export exp4=`date -d "$exp3 days" +%d-%m-%Y"`

sed -i "s/#vls $user $exp $harini $uuid/#vls $user $exp4 $harini $uuid/g" /usr/local/etc/xray/vless.json
sed -i "s/#vls $user $exp $harini $uuid/#vls $user $exp4 $harini $uuid/g" /usr/local/etc/xray/vlessnone.json

systemctl restart xray@vless
systemctl restart xray@vlessnone
service cron restart

clear
echo ""
echo " VLESS WS Account Was Successfully Renewed"
echo " •───────────────────────────────•"
echo " Client Name : $user"
echo " Expired On  : $exp4"
echo " •───────────────────────────────•"
echo ""
read -n 1 -s -r -p "Press any key to back on menu xray"
vless-menu
}

# show user vless ws
function menu11 () {
clear
MYIP=$(wget -qO- ipv4.icanhazip.com)
tls="$(cat ~/log-install.txt | grep -w "Vless Ws Tls" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vless Ws None Tls" | cut -d: -f2|sed 's/ //g')"
NUMBER_OF_CLIENTS=$(grep -c -E "^#vls " "/usr/local/etc/xray/vless.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo "You have no existing clients!"
	  echo ""
    read -n 1 -s -r -p "Press any key to back on menu xray"
vless-menu
  fi

	clear
	echo ""
	echo "SHOW USER XRAY VLESS WS"
	echo "Select the existing client you want to renew"
	echo " Press CTRL+C to return"
	echo -e "•───────────────────────────────•"
	grep -E "^#vls " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
export patchtls=/kontol-vlesswstls
export patchnontls=/kontol-vlesswsntls
export user=$(grep -E "^#vls " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
export harini=$(grep -E "^#vls " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
export exp=$(grep -E "^#vls " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
export uuid=$(grep -E "^#vls " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)

export vlesslink1="vless://${uuid}@${sts}${domain}:$tls?path=$patchtls&security=tls&encryption=none&type=ws&sni=$sni&type=ws#${user}$exp"
export vlesslink2="vless://${uuid}@${sts}${domain}:$none?path=$patchnontls&encryption=none&host=$sni&type=ws#${user}$exp"
export vlesslink3="vless://${uuid}@${sts}${domain}:$none?path=$patchnontls&encryption=none&host=maingame.com.my&type=ws#${user}$exp"
export vlesslink4="vless://${uuid}@${sts}${MYIP}:$none?path=$patchnontls&encryption=none&host=maingame.com.my&type=ws#${user}$exp"
export vlesslink5="vless://${uuid}@${sts}www.speedtest.net:$none?path=$patchnontls&encryption=none&host=${domain}&type=ws#${user}$exp"
export vlesslink6="vless://${uuid}@${sts}help.viu.com:$none?path=$patchnontls&encryption=none&host=${domain}&type=ws#${user}$exp"
export vlesslink7="vless://${uuid}@${sts}${domain}:$tls?path=$patchtls&security=tls&encryption=none&host=playtv.unifi.com.my&type=ws&sni=playtv.unifi.com.my#${user}$exp"
export vlesslink8="vless://${uuid}@${sts}yes.hate-me.eu.org:$none?path=$patchnontls&encryption=none&host=cdn.who.int.${domain}&type=ws#${user}$exp"
export vlesslink9="vless://${uuid}@${sts}162.159.134.61:$none?path=$patchnontls&encryption=none&host=${domain}&type=ws#${user}$exp"
export vlesslink10="vless://${uuid}@${sts}api.useinsider.com:$none?path=$patchnontls&encryption=none&host=${domain}&type=ws#${user}$exp"
export vlesslink11="vless://${uuid}@${sts}${domain}:$tls?path=$patchtls&security=tls&encryption=none&host=${domain}&type=ws&sni=sso.pokemon.com&host#${user}$exp"
export vlesslink12="vless://${uuid}@${sts}m.google.com.my.${domain}:$none?path=$patchnontls&encryption=none&host=api.instagram.com&type=ws#${user}$exp"
export vlesslink13="vless://${uuid}@${sts}${domain}:$tls?path=$patchtls&security=tls&encryption=none&host=esports.pubgmobile.com.esports.mobilelegends.com&type=ws&sni=esports.pubgmobile.com.esports.mobilelegends.com#${user}$exp"


clear
echo -e ""
echo -e "\e[$line┌──────────────────────────────────────────────────────┐\e[m"
echo -e "\e[$line│\e[$box                     XRAY VLESS WS                    \e[$line│\e[m"
echo -e "\e[$line└──────────────────────────────────────────────────────┘ \e[m"
echo -e "Remarks          : ${user}"
echo -e "Domain           : ${domain}"
echo -e "IP/Host          : $MYIP"
echo -e "Port TLS         : $tls"
echo -e "Port None TLS    : $none"
echo -e "User ID          : ${uuid}"
echo -e "Encryption       : None"
echo -e "Network          : WebSocket"
echo -e "Path Tls         : $patchtls"
echo -e "Path None Tls    : $patchnontls"
echo -e "allowInsecure    : True/allow"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link TLS         : ${vlesslink1}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link None TLS    : ${vlesslink2}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link ${YLW}UMOBILE${NC}     : ${vlesslink3}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link ${YLW}UMOBILE ALL${NC} : ${vlesslink4}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link ${BLU}2 In One${NC}    : ${vlesslink5}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link ${RED}MAXISTV${NC}     : ${vlesslink6}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link ${YLW}UNIFI${NC}       : ${vlesslink7}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link ${PLE}YES4g/5g${NC}    : ${vlesslink8}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link ${YLW}DiGi3Mb${NC}     : ${vlesslink9}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link ${YLW}DiGiAPN${NC}     : ${vlesslink10}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link ${YLW}DiGi Poke${NC}   : ${vlesslink11}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link ${YLW}DiGi Sosial${NC} : ${vlesslink12}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link ${YLW}Yodoo Add On${NC}: ${vlesslink13}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "\e[$line TLS QRcode\e[m"
qrencode -t ansiutf8 "vless://${uuid}@${sts}${domain}:$tls?path=$patchtls&security=tls&encryption=none&type=ws&sni=$sni&type=ws#${user}"
echo -e "\e[$line NTLS QRcode\e[m"
qrencode -t ansiutf8 "vless://${uuid}@${sts}${domain}:$none?path=$patchnontls&encryption=none&host=$sni&type=ws#${user}" 
echo ""
echo -e "Created   : $harini"
echo -e "Expired   : $exp"
echo ""
read -n 1 -s -r -p "Press any key to back on menu xray"
vless-menu
}

# USER LOGIN VLESS WS
function menu12 () {
clear
echo -n > /tmp/other.txt
data=( `cat /usr/local/etc/xray/vless.json | grep '^#vls' | cut -d ' ' -f 2 | sort | uniq`);
echo -e "\e[$line┌──────────────────────────────────────────────────────┐\e[m"
echo -e "\e[$line│\e[$box              XRAY Vless WS User Login                \e[$line│\e[m"
echo -e "\e[$line└──────────────────────────────────────────────────────┘ \e[m"
for akun in "${data[@]}"; do
if [[ -z "$akun" ]]; then
akun="Tidak Ada"
fi
echo -n >/tmp/ipvless.txt
data2=($(cat /var/log/xray/access.log | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | sort | uniq))
for ip in "${data2[@]}"; do
jum=$(cat /var/log/xray/access.log | grep -w "$akun" | tail -n 500 | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | grep -w "$ip" | sort | uniq)
if [[ "$jum" = "$ip" ]]; then
echo "$jum" >>/tmp/ipvless.txt
else
echo "$ip" >>/tmp/other.txt
fi
jum2=$(cat /tmp/ipvless.txt)
sed -i "/$jum2/d" /tmp/other.txt >/dev/null 2>&1
done
jum=$(cat /tmp/ipvless.txt)
if [[ -z "$jum" ]]; then
echo >/dev/null
else
jum2=$(cat /tmp/ipvless.txt | nl)
echo "user : $akun"
echo "$jum2"
echo ""
echo -e "\e[$line•───────────────────────────────•\e[m"
fi
done
rm -rf /tmp/ipvless.txt
rm -rf /tmp/other.txt
echo ""
read -n 1 -s -r -p "         Press any key to back on menu xray"
vless-menu
}

# CREATE USER VLESS XTLS
function menu13 () {
clear
MYIP=$(wget -qO- ipv4.icanhazip.com)
xtls="$(cat ~/log-install.txt | grep -w "Vless Tcp Xtls" | cut -d: -f2|sed 's/ //g')"
echo -e "\e[$line┌──────────────────────────────────────────────────────┐\e[m"
echo -e "\e[$line│\e[$box             CREATE USER XRAY VLESS XTLS              \e[$line│\e[m"
echo -e "\e[$line└──────────────────────────────────────────────────────┘ \e[m"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Username: " -e user
		CLIENT_EXISTS=$(grep -w $user /usr/local/etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
export uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Bug Address (Example: www.google.com) : " address
read -p "Bug SNI/Host (Example : m.facebook.com) : " sni
read -p "Expired (days) : " masaaktif

bug_addr=${address}.
bug_addr2=$address
if [[ $address == "" ]]; then
sts=$bug_addr2
else
sts=$bug_addr
fi

export exp=`date -d "$masaaktif days" +%d-%m-%Y"`
export harini=`date -d "0 days" +%d-%m-%Y"`

sed -i '/#xray-vless-xtls$/a\#vxtls '"$user $exp $harini $uuid"'\
},{"id": "'""$uuid""'","flow": "'""xtls-rprx-direct""'","level": '"0"',"email": "'""$user""'"' /usr/local/etc/xray/config.json

export vlesslink1="vless://${uuid}@${sts}${domain}:$xtls?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-direct&sni=$sni#${user}"
export vlesslink2="vless://${uuid}@${sts}${domain}:$xtls?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-splice&sni=$sni#${user}"
export vlesslink3="vless://${uuid}@${sts}${MYIP}:$xtls?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-direct&sni=maingame.com.my#${user}$exp"
export vlesslink4="vless://${uuid}@${sts}${domain}:$xtls?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-direct&sni=open.spotify.com#${user}$exp"

systemctl restart xray.service

clear
echo -e ""
echo -e "\e[$line┌──────────────────────────────────────────────────────┐\e[m"
echo -e "\e[$line│\e[$box                    XRAY VLESS XTLS                   \e[$line│\e[m"
echo -e "\e[$line└──────────────────────────────────────────────────────┘ \e[m"
echo -e "Remarks        : ${user}"
echo -e "Domain         : ${domain}"
echo -e "Ip/Host        : ${MYIP}"
echo -e "Port Xtls      : $xtls"
echo -e "User ID        : ${uuid}"
echo -e "Encryption     : None"
echo -e "Network        : TCP"
echo -e "Flow           : Direct & Splice"
echo -e "allowInsecure  : True"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link Xtls Direct  : ${vlesslink1}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link Xtls Splice  : ${vlesslink2}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link ${YLW}UMOBILE${NC}     : ${vlesslink3}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link ${BLU}BeOne${NC}       : ${vlesslink4}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "\e[$line Direct QRcode\e[m"
qrencode -t ansiutf8 "vless://${uuid}@${sts}${domain}:$xtls?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-direct&sni=$sni#${user}"
echo -e "\e[$line Splice QRcode\e[m"
qrencode -t ansiutf8 "vless://${uuid}@${sts}${domain}:$xtls?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-splice&sni=$sni#${user}" 
echo ""
echo -e "Created  : $harini"
echo -e "Expired  : $exp"
echo ""
read -n 1 -s -r -p "Press any key to back on menu xray"
vless-menu
}

# TRIAL USER VLESS XTLS
function menu14 () {
clear
MYIP=$(wget -qO- ipv4.icanhazip.com)
xtls="$(cat ~/log-install.txt | grep -w "Vless Tcp Xtls" | cut -d: -f2|sed 's/ //g')"
echo -e "\e[$line┌──────────────────────────────────────────────────────┐\e[m"
echo -e "\e[$line│\e[$box             TRIAL USER XRAY VLESS XTLS               \e[$line│\e[m"
echo -e "\e[$line└──────────────────────────────────────────────────────┘ \e[m"

# // Create Expried 
export masaaktif="1"
export exp=$(date -d "$masaaktif days" +%d-%m-%Y")

# // Make Random Username 
export user=Trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
export uuid=$(cat /proc/sys/kernel/random/uuid)

read -p "Bug Address (Example: www.google.com) : " address
read -p "Bug SNI/Host (Example : m.facebook.com) : " sni

bug_addr=${address}.
bug_addr2=$address
if [[ $address == "" ]]; then
sts=$bug_addr2
else
sts=$bug_addr
fi

export harini=`date -d "0 days" +%d-%m-%Y"`

sed -i '/#xray-vless-xtls$/a\#vxtls '"$user $exp $harini $uuid"'\
},{"id": "'""$uuid""'","flow": "'""xtls-rprx-direct""'","level": '"0"',"email": "'""$user""'"' /usr/local/etc/xray/config.json

export vlesslink1="vless://${uuid}@${sts}${domain}:$xtls?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-direct&sni=$sni#${user}"
export vlesslink2="vless://${uuid}@${sts}${domain}:$xtls?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-splice&sni=$sni#${user}"
export vlesslink3="vless://${uuid}@${sts}${MYIP}:$xtls?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-direct&sni=maingame.com.my#${user}$exp"
export vlesslink4="vless://${uuid}@${sts}${domain}:$xtls?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-direct&sni=open.spotify.com#${user}$exp"

systemctl restart xray.service

clear
echo -e ""
echo -e "\e[$line┌──────────────────────────────────────────────────────┐\e[m"
echo -e "\e[$line│\e[$box                TRIAL XRAY VLESS XTLS                 \e[$line│\e[m"
echo -e "\e[$line└──────────────────────────────────────────────────────┘ \e[m"
echo -e "Remarks        : ${user}"
echo -e "Domain         : ${domain}"
echo -e "Ip/Host        : ${MYIP}"
echo -e "Port Xtls      : $xtls"
echo -e "User ID        : ${uuid}"
echo -e "Encryption     : None"
echo -e "Network        : TCP"
echo -e "Flow           : Direct & Splice"
echo -e "allowInsecure  : True"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link Xtls Direct  : ${vlesslink1}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link Xtls Splice  : ${vlesslink2}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link ${YLW}UMOBILE${NC}     : ${vlesslink3}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link ${BLU}BeOne${NC}       : ${vlesslink4}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "\e[$line Direct QRcode\e[m"
qrencode -t ansiutf8 "vless://${uuid}@${sts}${domain}:$xtls?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-direct&sni=$sni#${user}"
echo -e "\e[$line Splice QRcode\e[m"
qrencode -t ansiutf8 "vless://${uuid}@${sts}${domain}:$xtls?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-splice&sni=$sni#${user}" 
echo ""
echo -e "Created  : $harini"
echo -e "Expired  : $exp"
echo ""
read -n 1 -s -r -p "Press any key to back on menu xray"
vless-menu
}

# DELETE VLESS XTLS
function menu15 () {
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^#vxtls " "/usr/local/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo "You have no existing clients!"
    echo ""
    read -n 1 -s -r -p "Press any key to back on menu xray"
vless-menu
	fi

	clear
	echo ""
	echo " Delete User Xray Vless Tcp Xtls"
	echo " Select the existing client you want to remove"
	echo " Press CTRL+C to return"
	echo " •───────────────────────────────•"
	echo "     No  Expired   User"
	grep -E "^#vxtls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
export harini=$(grep -E "^#vxtls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
export uuid=$(grep -E "^#vxtls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
export user=$(grep -E "^#vxtls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
export exp=$(grep -E "^#vxtls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)

sed -i "/^#vxtls $user $exp $harini $uuid/,/^},{/d" /usr/local/etc/xray/config.json

systemctl restart xray.service

clear
echo " Xray Vless Tcp Xtls Account Deleted Successfully"
echo " •───────────────────────────────•"
echo " Client Name : $user"
echo " Expired On  : $exp"
echo " •───────────────────────────────•"
echo ""
read -n 1 -s -r -p "Press any key to back on menu xray"
vless-menu
}

# RENEW VLESS XTLS
function menu16 () {
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^#vxtls " "/usr/local/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo ""
		echo "You have no existing clients!"
		echo ""
    read -n 1 -s -r -p "Press any key to back on menu xray"
vless-menu
	fi

	clear
	echo ""
	echo "Renew User Xray Vless Tcp Xtls"
	echo "Select the existing client you want to renew"
	echo " Press CTRL+C to return"
	echo -e "•───────────────────────────────•"
	grep -E "^#vxtls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
read -p "Expired (days): " masaaktif
export harini=$(grep -E "^#vxtls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
export uuid=$(grep -E "^#vxtls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
export user=$(grep -E "^#vxtls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
export exp=$(grep -E "^#vxtls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
export now=$(date +%d-%m-%Y")
export d1=$(date -d "$exp" +%s)
export d2=$(date -d "$now" +%s)
export exp2=$(( (d1 - d2) / 86400 ))
export exp3=$(($exp2 + $masaaktif))
export exp4=`date -d "$exp3 days" +%d-%m-%Y"`

sed -i "s/#vxtls $user $exp $harini $uuid/#vxtls $user $exp4 $harini $uuid/g" /usr/local/etc/xray/config.json

systemctl restart xray.service
service cron restart

clear
echo ""
echo " Xray Vless Tcp Xtls Account Was Successfully Renewed"
echo " •───────────────────────────────•"
echo " Client Name : $user"
echo " Expired On  : $exp4"
echo " •───────────────────────────────•"
echo ""
read -n 1 -s -r -p "Press any key to back on menu xray"
vless-menu
}

#SHOW VLESS XTLS
function menu17 () {
clear
MYIP=$(wget -qO- ipv4.icanhazip.com)
xtls="$(cat ~/log-install.txt | grep -w "Vless Tcp Xtls" | cut -d: -f2|sed 's/ //g')"
NUMBER_OF_CLIENTS=$(grep -c -E "^#vxtls " "/usr/local/etc/xray/config.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo ""
		echo "You have no existing clients!"
    echo ""
    read -n 1 -s -r -p "Press any key to back on menu xray"
vless-menu
	fi

	clear
	echo ""
	echo "SHOW USER XRAY VLESS XTLS"
	echo "Select the existing client you want to renew"
	echo " Press CTRL+C to return"
	echo -e "•───────────────────────────────•"
	grep -E "^#vxtls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
export user=$(grep -E "^#vxtls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
export harini=$(grep -E "^#vxtls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
export exp=$(grep -E "^#vxtls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
export uuid=$(grep -E "^#vxtls " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)

export vlesslink1="vless://${uuid}@${domain}:$xtls?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-direct&sni=bug.com#${user}"
export vlesslink2="vless://${uuid}@${domain}:$xtls?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-splice&sni=bug.com#${user}"
export vlesslink3="vless://${uuid}@${sts}${MYIP}:$xtls?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-direct&sni=maingame.com.my#${user}$exp"
export vlesslink4="vless://${uuid}@${sts}${domain}:$xtls?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-direct&sni=open.spotify.com#${user}$exp"

clear
echo -e ""
echo -e "\e[$line┌──────────────────────────────────────────────────────┐\e[m"
echo -e "\e[$line│\e[$box                    XRAY VLESS XTLS                   \e[$line│\e[m"
echo -e "\e[$line└──────────────────────────────────────────────────────┘ \e[m"
echo -e "Remarks          : ${user}"
echo -e "Domain           : ${domain}"
echo -e "Ip/Host          : ${MYIP}"
echo -e "Port Xtls        : $xtls"
echo -e "User ID          : ${uuid}"
echo -e "Encryption       : None"
echo -e "Network          : TCP"
echo -e "Flow             : Direct & Splice"
echo -e "allowInsecure    : True"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link Xtls Direct : ${vlesslink1}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link Xtls Splice : ${vlesslink2}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link ${YLW}UMOBILE${NC}     : ${vlesslink3}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link ${BLU}BeOne${NC}       : ${vlesslink4}"
echo -e "\e[$line•────────────────•\e[m
echo -e "\e[$line Direct QRcode\e[m"
qrencode -t ansiutf8 "vless://${uuid}@${domain}:$xtls?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-direct&sni=bug.com#${user}"
echo -e "\e[$line Splice QRcode\e[m"
qrencode -t ansiutf8 "vless://${uuid}@${domain}:$xtls?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-splice&sni=bug.com#${user}" 
echo ""
echo -e "Created    : $harini"
echo -e "Expired    : $exp"
echo ""
read -n 1 -s -r -p "Press any key to back on menu xray"
vless-menu
}

# CEK USER LOGIN VLESS XTLS
function menu18 () {
clear
echo -n > /tmp/other.txt
data=( `cat /usr/local/etc/xray/config.json | grep '^#vxtls' | cut -d ' ' -f 2`);
echo -e "   \e[$line┌──────────────────────────────────────────────────────┐\e[m"
echo -e "   \e[$line│\e[$box            XRAY Vless Xtls User Login                \e[$line│\e[m"
echo -e "   \e[$line└──────────────────────────────────────────────────────┘ \e[m"
for akun in "${data[@]}"
do
if [[ -z "$akun" ]]; then
akun="tidakada"
fi
echo -n > /tmp/ipxray.txt
data2=( `netstat -anp | grep ESTABLISHED | grep tcp6 | grep xray | awk '{print $5}' | cut -d: -f1 | sort | uniq`);
for ip in "${data2[@]}"
do
jum=$(cat /var/log/xray/access.log | grep -w $akun | awk '{print $3}' | cut -d: -f1 | grep -w $ip | sort | uniq)
if [[ "$jum" = "$ip" ]]; then
echo "$jum" >> /tmp/ipxray.txt
else
echo "$ip" >> /tmp/other.txt
fi
jum2=$(cat /tmp/ipxray.txt)
sed -i "/$jum2/d" /tmp/other.txt > /dev/null 2>&1
done
jum=$(cat /tmp/ipxray.txt)
if [[ -z "$jum" ]]; then
echo > /dev/null
else
jum2=$(cat /tmp/ipxray.txt | nl)
echo "user : $akun";
echo "$jum2";
echo ""
echo -e "\e[$line•───────────────────────────────•\e[m"
fi
rm -rf /tmp/ipxray.txt
rm -rf /tmp/other.txt
done
echo ""
read -n 1 -s -r -p "          Press any key to back on menu xray"
vless-menu
}
# MENU XRAY VMESS & VLESS
clear
echo -e ""
echo -e "   \e[$line┌──────────────────────────────────────────────────────┐\e[m"
echo -e "   \e[$line│\e[$box            PANEL XRAY VLESS WEBSOCKET TLS            \e[$line│\e[m"
echo -e "   \e[$line└──────────────────────────────────────────────────────┘\e[m"
echo -e "      [\e[$number 01${NC}]\e[$below • Create Vless Websocket Account\e[m"
echo -e "      [\e[$number 02${NC}]\e[$below • Trial User Vless Websocket\e[m"
echo -e "      [\e[$number 03${NC}]\e[$below • Deleting Vless Websocket Account\e[m"
echo -e "      [\e[$number 04${NC}]\e[$below • Renew Vless Websocket Account\e[m"
echo -e "      [\e[$number 05${NC}]\e[$below • Show Config Vless Account\e[m"
echo -e "      [\e[$number 06${NC}]\e[$below • Check User Login Vless\e[m"
echo -e ""
echo -e "   \e[$number    >> Total :\e[m \e[$below ${total2} Client\e[m"
echo -e "   \e[$line┌──────────────────────────────────────────────────────┐\e[m"
echo -e "   \e[$line│\e[$box          XRAY VLESS TCP XTLS(Direct & Splice)        \e[$line│\e[m"
echo -e "   \e[$line└──────────────────────────────────────────────────────┘\e[m"
echo -e "      [\e[$number 07${NC}]\e[$below • Create Xray VLess Xtls Account\e[m"
echo -e "      [\e[$number 08${NC}]\e[$below • Trial User Vless Xtls\e[m"
echo -e "      [\e[$number 09${NC}]\e[$below • Deleting Xray Vless Xtls Account\e[m"
echo -e "      [\e[$number 10${NC}]\e[$below • Renew Xray Vless Xtls Account\e[m"
echo -e "      [\e[$number 11${NC}]\e[$below • Show Config Vless Xtls Account\e[m"
echo -e "      [\e[$number 12${NC}]\e[$below • Check User Login Vless Xtls\e[m"
echo -e ""
echo -e "   \e[$number    >> Total :\e[m \e[$below ${total3} Client\e[m"
echo -e ""
echo -e "                 Press [ x ] To Go Main Menu "
echo -e ""
read -rp "        Please Input Number  [1-12 or x] :  "  num
echo -e ""
if [[ "$num" = "1" ]]; then
menu7
elif [[ "$num" = "2" ]]; then
menu8
elif [[ "$num" = "3" ]]; then
menu9
elif [[ "$num" = "4" ]]; then
menu10
elif [[ "$num" = "5" ]]; then
menu11
elif [[ "$num" = "6" ]]; then
menu12
elif [[ "$num" = "7" ]]; then
menu13
elif [[ "$num" = "8" ]]; then
menu14
elif [[ "$num" = "9" ]]; then
menu15
elif [[ "$num" = "10" ]]; then
menu16
elif [[ "$num" = "11" ]]; then
menu17
elif [[ "$num" = "12" ]]; then
menu18
elif [[ "$num" = "x" ]]; then
xray-menu
else
echo -e "\e[1;31mYou Entered The Wrong Number, Please Try Again!\e[0m"
sleep 1
vless-menu
fi