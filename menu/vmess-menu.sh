#!/bin/bash
GitUser="Jesanne87"
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

# // FUCTION ADD USER
function menu1 () {
clear
tls="$(cat ~/log-install.txt | grep -w "Vmess Ws Tls" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vmess Ws None Tls" | cut -d: -f2|sed 's/ //g')"
echo -e   "\e[$line┌──────────────────────────────────────────────────────┐\e[m"
echo -e   "\e[$line│           \e[$box CREATE USER XRAY VMESS WS TLS             \e[$line│  \e[m"
echo -e   "\e[$line└──────────────────────────────────────────────────────┘\e[m"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Username: " -e user
		CLIENT_EXISTS=$(grep -w $user /usr/local/etc/xray/vmess.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
export patchtls=/kontol-vmesswstls
export patchnontls=/kontol-vmesswsntls
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

export exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
export harini=`date -d "0 days" +"%Y-%m-%d"`

sed -i '/#xray-vmess-tls$/a\#vms '"$user $exp $harini $uuid"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /usr/local/etc/xray/vmess.json
sed -i '/#xray-vmess-nontls$/a\#vms '"$user $exp $harini $uuid"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /usr/local/etc/xray/vmessnone.json

cat>/usr/local/etc/xray/$user-tls.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${sts}${domain}",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "$patchtls",
      "type": "none",
      "host": "$sni",
      "tls": "tls",
	  "sni": "$sni"
}
EOF
cat>/usr/local/etc/xray/$user-none.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${sts}${domain}",
      "port": "${none}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "$patchnontls",
      "type": "none",
      "host": "$sni",
      "tls": "none"
}
EOF

cat > /usr/local/etc/xray/$user-clash-for-android.yaml <<-END
# Generated Vmess with Clash For Android
# Generated by Techslim
# Credit : Clash For Android

# CONFIG CLASH VMESS
port: 7890
socks-port: 7891
allow-lan: true
mode: Rule
log-level: info
external-controller: 127.0.0.1:9090
proxies:
  - {name: $user, server: ${sts}${domain}, port: $none, type: vmess, uuid: $uuid, alterId: 0, cipher: auto, tls: false, network: ws, ws-path: $patchnontls, ws-headers: {Host: $sni}}
proxy-groups:
  - name: ðŸš€ èŠ‚ç‚¹é€‰æ‹©
    type: select
    proxies:
      - â™»ï¸ è‡ªåŠ¨é€‰æ‹©
      - DIRECT
      - $user
  - name: â™»ï¸ è‡ªåŠ¨é€‰æ‹©
    type: url-test
    url: http://www.gstatic.com/generate_204
    interval: 300
    tolerance: 50
    proxies:
      - $user
  - name: ðŸŒ å›½å¤–åª’ä½“
    type: select
    proxies:
      - ðŸš€ èŠ‚ç‚¹é€‰æ‹©
      - â™»ï¸ è‡ªåŠ¨é€‰æ‹©
      - ðŸŽ¯ å…¨çƒç›´è¿ž
      - $user
  - name: ðŸ“² ç”µæŠ¥ä¿¡æ¯
    type: select
    proxies:
      - ðŸš€ èŠ‚ç‚¹é€‰æ‹©
      - ðŸŽ¯ å…¨çƒç›´è¿ž
      - $user
  - name: â“‚ï¸ å¾®è½¯æœåŠ¡
    type: select
    proxies:
      - ðŸŽ¯ å…¨çƒç›´è¿ž
      - ðŸš€ èŠ‚ç‚¹é€‰æ‹©
      - $user
  - name: ðŸŽ è‹¹æžœæœåŠ¡
    type: select
    proxies:
      - ðŸš€ èŠ‚ç‚¹é€‰æ‹©
      - ðŸŽ¯ å…¨çƒç›´è¿ž
      - $user
  - name: ðŸ“¢ è°·æ­ŒFCM
    type: select
    proxies:
      - ðŸš€ èŠ‚ç‚¹é€‰æ‹©
      - ðŸŽ¯ å…¨çƒç›´è¿ž
      - â™»ï¸ è‡ªåŠ¨é€‰æ‹©
      - $user
  - name: ðŸŽ¯ å…¨çƒç›´è¿ž
    type: select
    proxies:
      - DIRECT
      - ðŸš€ èŠ‚ç‚¹é€‰æ‹©
      - â™»ï¸ è‡ªåŠ¨é€‰æ‹©
  - name: ðŸ›‘ å…¨çƒæ‹¦æˆª
    type: select
    proxies:
      - REJECT
      - DIRECT
  - name: ðŸƒ åº”ç”¨å‡€åŒ–
    type: select
    proxies:
      - REJECT
      - DIRECT
  - name: ðŸŸ æ¼ç½‘ä¹‹é±¼
    type: select
    proxies:
      - ðŸš€ èŠ‚ç‚¹é€‰æ‹©
      - ðŸŽ¯ å…¨çƒç›´è¿ž
      - â™»ï¸ è‡ªåŠ¨é€‰æ‹©
      - $user
END
# // masukkan payloadnya ke dalam config yaml
cat /etc/openvpn/server/cll.key >> /usr/local/etc/xray/$user-clash-for-android.yaml

# // Copy config Yaml client ke home directory root agar mudah didownload ( YAML )
cp /usr/local/etc/xray/$user-clash-for-android.yaml /home/vps/public_html/$user-clash-for-android.yaml

export vmess_base641=$( base64 -w 0 <<< $vmess_json1)
export vmess_base642=$( base64 -w 0 <<< $vmess_json2)
export vmesslink1="vmess://$(base64 -w 0 /usr/local/etc/xray/$user-tls.json)"
export vmesslink2="vmess://$(base64 -w 0 /usr/local/etc/xray/$user-none.json)"
systemctl restart xray@vmess
systemctl restart xray@vmessnone
service cron restart

clear
echo -e ""
echo -e "\e[$line┌──────────────────────────────────────────────────────┐\e[m"
echo -e "\e[$line│                  \e[$box XRAY VMESS WS                     \e[$line │ \e[m"
echo -e "\e[$line└──────────────────────────────────────────────────────┘\e[m"
echo -e "Remarks          : ${user}"
echo -e "Domain           : ${domain}"
echo -e "IP/Host          : $MYIP"
echo -e "Port TLS         : ${tls}"
echo -e "Port None TLS    : ${none}"
echo -e "User ID          : ${uuid}"
echo -e "Security         : Auto"
echo -e "Network          : Websocket"
echo -e "Path Tls         : $patchtls"
echo -e "Path None Tls    : $patchnontls"
echo -e "allowInsecure    : True/allow"
echo -e "Support Yaml     : YES"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link TLS         : ${vmesslink1}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link None TLS    : ${vmesslink2}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link Yaml        : http://$MYIP:81/$user-clash-for-android.yaml"
echo -e "\e[$line•────────────────•\e[m"
echo -e "\e[$line TLS QRcode\e[m"
qrencode -t ansiutf8 "vmess://$(base64 -w 0 /usr/local/etc/xray/$user-tls.json)"
echo -e "\e[$line NTLS QRcode\e[m"
qrencode -t ansiutf8 "vmess://$(base64 -w 0 /usr/local/etc/xray/$user-none.json)" 
echo ""
echo -e "Created          : $harini"
echo -e "Expired          : $exp"
echo ""
read -n 1 -s -r -p "Press any key to back on menu xray"
vmess-menu
}

# // TRIAL USER
function menu2 () {
clear
tls="$(cat ~/log-install.txt | grep -w "Vmess Ws Tls" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vmess Ws None Tls" | cut -d: -f2|sed 's/ //g')"
echo -e "\e[$line┌──────────────────────────────────────────────────────┐\e[m"
echo -e "\e[$line│           \e[$box TRIAL USER XRAY VMESS WS TLS             \e[$line │ \e[m"
echo -e "\e[$line└──────────────────────────────────────────────────────┘\e[m"

# // Exp
export masaaktif="1"
export exp=$(date -d "$masaaktif days" +"%Y-%m-%d")

# // Make Random Username 
export user=Trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
export patchtls=/kontol-vmesswstls
export patchnontls=/kontol-vmesswsntls
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

export harini=`date -d "0 days" +"%Y-%m-%d"`

sed -i '/#xray-vmess-tls$/a\#vms '"$user $exp $harini $uuid"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /usr/local/etc/xray/vmess.json
sed -i '/#xray-vmess-nontls$/a\#vms '"$user $exp $harini $uuid"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /usr/local/etc/xray/vmessnone.json

cat>/usr/local/etc/xray/$user-tls.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${sts}${domain}",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "$patchtls",
      "type": "none",
      "host": "$sni",
      "tls": "tls",
	  "sni": "$sni"
}
EOF
cat>/usr/local/etc/xray/$user-none.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${sts}${domain}",
      "port": "${none}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "$patchnontls",
      "type": "none",
      "host": "$sni",
      "tls": "none"
}
EOF

cat > /usr/local/etc/xray/$user-clash-for-android.yaml <<-END
# Generated Vmess with Clash For Android
# Generated by Techslim
# Credit : Clash For Android

# CONFIG CLASH VMESS
port: 7890
socks-port: 7891
allow-lan: true
mode: Rule
log-level: info
external-controller: 127.0.0.1:9090
proxies:
  - {name: $user, server: ${sts}${domain}, port: $none, type: vmess, uuid: $uuid, alterId: 0, cipher: auto, tls: false, network: ws, ws-path: $patchnontls, ws-headers: {Host: $sni}}
proxy-groups:
  - name: ðŸš€ èŠ‚ç‚¹é€‰æ‹©
    type: select
    proxies:
      - â™»ï¸ è‡ªåŠ¨é€‰æ‹©
      - DIRECT
      - $user
  - name: â™»ï¸ è‡ªåŠ¨é€‰æ‹©
    type: url-test
    url: http://www.gstatic.com/generate_204
    interval: 300
    tolerance: 50
    proxies:
      - $user
  - name: ðŸŒ å›½å¤–åª’ä½“
    type: select
    proxies:
      - ðŸš€ èŠ‚ç‚¹é€‰æ‹©
      - â™»ï¸ è‡ªåŠ¨é€‰æ‹©
      - ðŸŽ¯ å…¨çƒç›´è¿ž
      - $user
  - name: ðŸ“² ç”µæŠ¥ä¿¡æ¯
    type: select
    proxies:
      - ðŸš€ èŠ‚ç‚¹é€‰æ‹©
      - ðŸŽ¯ å…¨çƒç›´è¿ž
      - $user
  - name: â“‚ï¸ å¾®è½¯æœåŠ¡
    type: select
    proxies:
      - ðŸŽ¯ å…¨çƒç›´è¿ž
      - ðŸš€ èŠ‚ç‚¹é€‰æ‹©
      - $user
  - name: ðŸŽ è‹¹æžœæœåŠ¡
    type: select
    proxies:
      - ðŸš€ èŠ‚ç‚¹é€‰æ‹©
      - ðŸŽ¯ å…¨çƒç›´è¿ž
      - $user
  - name: ðŸ“¢ è°·æ­ŒFCM
    type: select
    proxies:
      - ðŸš€ èŠ‚ç‚¹é€‰æ‹©
      - ðŸŽ¯ å…¨çƒç›´è¿ž
      - â™»ï¸ è‡ªåŠ¨é€‰æ‹©
      - $user
  - name: ðŸŽ¯ å…¨çƒç›´è¿ž
    type: select
    proxies:
      - DIRECT
      - ðŸš€ èŠ‚ç‚¹é€‰æ‹©
      - â™»ï¸ è‡ªåŠ¨é€‰æ‹©
  - name: ðŸ›‘ å…¨çƒæ‹¦æˆª
    type: select
    proxies:
      - REJECT
      - DIRECT
  - name: ðŸƒ åº”ç”¨å‡€åŒ–
    type: select
    proxies:
      - REJECT
      - DIRECT
  - name: ðŸŸ æ¼ç½‘ä¹‹é±¼
    type: select
    proxies:
      - ðŸš€ èŠ‚ç‚¹é€‰æ‹©
      - ðŸŽ¯ å…¨çƒç›´è¿ž
      - â™»ï¸ è‡ªåŠ¨é€‰æ‹©
      - $user
END
# // masukkan payloadnya ke dalam config yaml
cat /etc/openvpn/server/cll.key >> /usr/local/etc/xray/$user-clash-for-android.yaml

# // Copy config Yaml client ke home directory root agar mudah didownload ( YAML )
cp /usr/local/etc/xray/$user-clash-for-android.yaml /home/vps/public_html/$user-clash-for-android.yaml

export vmess_base641=$( base64 -w 0 <<< $vmess_json1)
export vmess_base642=$( base64 -w 0 <<< $vmess_json2)
export vmesslink1="vmess://$(base64 -w 0 /usr/local/etc/xray/$user-tls.json)"
export vmesslink2="vmess://$(base64 -w 0 /usr/local/etc/xray/$user-none.json)"

systemctl restart xray@vmess
systemctl restart xray@vmessnone
service cron restart

clear
echo -e ""
echo -e "\e[$line┌──────────────────────────────────────────────────────┐\e[m"
echo -e "\e[$line│               \e[$box TRIAL XRAY VMESS WS                  \e[$line │ \e[m"
echo -e "\e[$line└──────────────────────────────────────────────────────┘\e[m"
echo -e "Remarks          : ${user}"
echo -e "Domain           : ${domain}"
echo -e "IP/Host          : $MYIP"
echo -e "Port TLS         : ${tls}"
echo -e "Port None TLS    : ${none}"
echo -e "User ID          : ${uuid}"
echo -e "Security         : Auto"
echo -e "Network          : Websocket"
echo -e "Path Tls         : $patchtls"
echo -e "Path None Tls    : $patchnontls"
echo -e "allowInsecure    : True/allow"
echo -e "Support Yaml     : YES"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link TLS         : ${vmesslink1}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link None TLS    : ${vmesslink2}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link Yaml    : http://$MYIP:81/$user-clash-for-android.yaml"
echo -e "\e[$line•────────────────•\e[m"
echo -e "\e[$line TLS QRcode\e[m"
qrencode -t ansiutf8 "vmess://$(base64 -w 0 /usr/local/etc/xray/$user-tls.json)"
echo -e "\e[$line NTLS QRcode\e[m"
qrencode -t ansiutf8 "vmess://$(base64 -w 0 /usr/local/etc/xray/$user-none.json)" 
echo ""
echo -e "Created     : $harini"
echo -e "Expired     : $exp"
echo ""
read -n 1 -s -r -p "Press any key to back on menu xray"
vmess-menu
}

# FUCTION DELETE USER
function menu3 () {
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^#vms " "/usr/local/etc/xray/vmess.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo "You have no existing clients!"
    echo ""
    read -n 1 -s -r -p "Press any key to back on menu xray"
vmess-menu
	fi

	clear
	echo " Delete User Xray Vmess Ws"
	echo " Select the existing client you want to remove"
	echo " Press CTRL+C to return"
	echo " •───────────────────────────────•"
	echo "     No  Expired   User"
	grep -E "^#vms " "/usr/local/etc/xray/vmess.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done	
export harini=$(grep -E "^#vms " "/usr/local/etc/xray/vmess.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
export uuid=$(grep -E "^#vms " "/usr/local/etc/xray/vmess.json" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
export user=$(grep -E "^#vms " "/usr/local/etc/xray/vmess.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
export exp=$(grep -E "^#vms " "/usr/local/etc/xray/vmess.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)

sed -i "/^#vms $user $exp $harini $uuid/,/^},{/d" /usr/local/etc/xray/vmess.json
sed -i "/^#vms $user $exp $harini $uuid/,/^},{/d" /usr/local/etc/xray/vmessnone.json

rm -f /usr/local/etc/xray/$user-tls.json
rm -f /usr/local/etc/xray/$user-none.json
rm -f /usr/local/etc/xray/$user-clash-for-android.yaml
rm -f /home/vps/public_html/$user-clash-for-android.yaml

systemctl restart xray@vmess
systemctl restart xray@vmessnone

clear
echo " XRAY VMESS WS Account Deleted Successfully"
echo " •───────────────────────────────•"
echo " Client Name : $user"
echo " Expired On  : $exp"
echo " •───────────────────────────────•"
echo ""
read -n 1 -s -r -p "Press any key to back on menu xray"
vmess-menu
}
# FUCTION RENEW USER
function menu4 () {
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^#vms " "/usr/local/etc/xray/vmess.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
			echo "You have no existing clients!"
		  echo "" 
    read -n 1 -s -r -p "Press any key to back on menu xray"
vmess-menu
	fi

	clear
	echo "Renew User Xray Vmess Ws"
	echo "Select the existing client you want to renew"
	echo " Press CTRL+C to return"
	echo -e "•───────────────────────────────•"
	grep -E "^#vms " "/usr/local/etc/xray/vmess.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
read -p "Expired (days): " masaaktif
export harini=$(grep -E "^#vms " "/usr/local/etc/xray/vmess.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
export uuid=$(grep -E "^#vms " "/usr/local/etc/xray/vmess.json" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
export user=$(grep -E "^#vms " "/usr/local/etc/xray/vmess.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
export exp=$(grep -E "^#vms " "/usr/local/etc/xray/vmess.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
export now=$(date +%Y-%m-%d)
export d1=$(date -d "$exp" +%s)
export d2=$(date -d "$now" +%s)
export exp2=$(( (d1 - d2) / 86400 ))
export exp3=$(($exp2 + $masaaktif))
export exp4=`date -d "$exp3 days" +"%Y-%m-%d"`

sed -i "s/#vms $user $exp $harini $uuid/#vms $user $exp4 $harini $uuid/g" /usr/local/etc/xray/vmess.json
sed -i "s/#vms $user $exp $harini $uuid/#vms $user $exp4 $harini $uuid/g" /usr/local/etc/xray/vmessnone.json

systemctl restart xray@vmess
systemctl restart xray@vmessnone
service cron restart

clear
echo ""
echo " VMESS WS & Clash Account Was Successfully Renewed"
echo " •───────────────────────────────•"
echo " Client Name : $user"
echo " Expired On  : $exp4"
echo " •───────────────────────────────•"
echo ""
read -n 1 -s -r -p "Press any key to back on menu xray"
vmess-menu
}

# show user
function menu5 () {
clear
tls="$(cat ~/log-install.txt | grep -w "Vmess Ws Tls" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vmess Ws None Tls" | cut -d: -f2|sed 's/ //g')"
NUMBER_OF_CLIENTS=$(grep -c -E "^#vms " "/usr/local/etc/xray/vmess.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo "You have no existing clients!"
		echo ""
    read -n 1 -s -r -p "Press any key to back on menu xray"
vmess-menu
	fi

	clear
	echo ""
	echo "SHOW USER XRAY VMESS WS"
	echo "Select the existing client you want to renew"
	echo " Press CTRL+C to return"
	echo -e "•───────────────────────────────•"
	grep -E "^#vms " "/usr/local/etc/xray/vmess.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
export patchtls=/kontol-vmesswstls
export patchnontls=/kontol-vmesswsntls
export user=$(grep -E "^#vms " "/usr/local/etc/xray/vmess.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
export harini=$(grep -E "^#vms " "/usr/local/etc/xray/vmess.json" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
export exp=$(grep -E "^#vms " "/usr/local/etc/xray/vmess.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
export uuid=$(grep -E "^#vms " "/usr/local/etc/xray/vmess.json" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
cat>/usr/local/etc/xray/$user-tls.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${sts}${domain}",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "$patchtls",
      "type": "none",
      "host": "bug.com",
      "tls": "tls",
	  "sni": "bug.com"
}
EOF
cat>/usr/local/etc/xray/$user-none.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${sts}${domain}",
      "port": "${none}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "$patchnontls",
      "type": "none",
      "host": "bug.com",
      "tls": "none"
}
EOF
cat > /usr/local/etc/xray/$user-clash-for-android.yaml <<-END
# Generated Vmess with Clash For Android
# Generated by Techslim
# Credit : Clash For Android

# CONFIG CLASH VMESS
port: 7890
socks-port: 7891
allow-lan: true
mode: Rule
log-level: info
external-controller: 127.0.0.1:9090
proxies:
  - {name: $user, server: ${sts}${domain}, port: $none, type: vmess, uuid: $uuid, alterId: 0, cipher: auto, tls: false, network: ws, ws-path: $patchnontls, ws-headers: {Host: bug.com}}
proxy-groups:
  - name: ðŸš€ èŠ‚ç‚¹é€‰æ‹©
    type: select
    proxies:
      - â™»ï¸ è‡ªåŠ¨é€‰æ‹©
      - DIRECT
      - $user
  - name: â™»ï¸ è‡ªåŠ¨é€‰æ‹©
    type: url-test
    url: http://www.gstatic.com/generate_204
    interval: 300
    tolerance: 50
    proxies:
      - $user
  - name: ðŸŒ å›½å¤–åª’ä½“
    type: select
    proxies:
      - ðŸš€ èŠ‚ç‚¹é€‰æ‹©
      - â™»ï¸ è‡ªåŠ¨é€‰æ‹©
      - ðŸŽ¯ å…¨çƒç›´è¿ž
      - $user
  - name: ðŸ“² ç”µæŠ¥ä¿¡æ¯
    type: select
    proxies:
      - ðŸš€ èŠ‚ç‚¹é€‰æ‹©
      - ðŸŽ¯ å…¨çƒç›´è¿ž
      - $user
  - name: â“‚ï¸ å¾®è½¯æœåŠ¡
    type: select
    proxies:
      - ðŸŽ¯ å…¨çƒç›´è¿ž
      - ðŸš€ èŠ‚ç‚¹é€‰æ‹©
      - $user
  - name: ðŸŽ è‹¹æžœæœåŠ¡
    type: select
    proxies:
      - ðŸš€ èŠ‚ç‚¹é€‰æ‹©
      - ðŸŽ¯ å…¨çƒç›´è¿ž
      - $user
  - name: ðŸ“¢ è°·æ­ŒFCM
    type: select
    proxies:
      - ðŸš€ èŠ‚ç‚¹é€‰æ‹©
      - ðŸŽ¯ å…¨çƒç›´è¿ž
      - â™»ï¸ è‡ªåŠ¨é€‰æ‹©
      - $user
  - name: ðŸŽ¯ å…¨çƒç›´è¿ž
    type: select
    proxies:
      - DIRECT
      - ðŸš€ èŠ‚ç‚¹é€‰æ‹©
      - â™»ï¸ è‡ªåŠ¨é€‰æ‹©
  - name: ðŸ›‘ å…¨çƒæ‹¦æˆª
    type: select
    proxies:
      - REJECT
      - DIRECT
  - name: ðŸƒ åº”ç”¨å‡€åŒ–
    type: select
    proxies:
      - REJECT
      - DIRECT
  - name: ðŸŸ æ¼ç½‘ä¹‹é±¼
    type: select
    proxies:
      - ðŸš€ èŠ‚ç‚¹é€‰æ‹©
      - ðŸŽ¯ å…¨çƒç›´è¿ž
      - â™»ï¸ è‡ªåŠ¨é€‰æ‹©
      - $user
END
# // masukkan payloadnya ke dalam config yaml
cat /etc/openvpn/server/cll.key >> /usr/local/etc/xray/$user-clash-for-android.yaml

# // Copy config Yaml client ke home directory root agar mudah didownload ( YAML )
cp /usr/local/etc/xray/$user-clash-for-android.yaml /home/vps/public_html/$user-clash-for-android.yaml
export vmess_base641=$( base64 -w 0 <<< $vmess_json1)
export vmess_base642=$( base64 -w 0 <<< $vmess_json2)
export vmesslink1="vmess://$(base64 -w 0 /usr/local/etc/xray/$user-tls.json)"
export vmesslink2="vmess://$(base64 -w 0 /usr/local/etc/xray/$user-none.json)"

clear
echo -e ""
echo -e "\e[$line┌──────────────────────────────────────────────────────┐\e[m"
echo -e "\e[$line│                   \e[$box XRAY VMESS WS                    \e[$line │ \e[m"
echo -e "\e[$line└──────────────────────────────────────────────────────┘\e[m"
echo -e "Remarks          : ${user}"
echo -e "Domain           : ${domain}"
echo -e "IP/Host          : $MYIP"
echo -e "Port TLS         : ${tls}"
echo -e "Port None TLS    : ${none}"
echo -e "User ID          : ${uuid}"
echo -e "Security         : Auto"
echo -e "Network          : Websocket"
echo -e "Path Tls         : $patchtls"
echo -e "Path None Tls    : $patchnontls"
echo -e "allowInsecure    : True/allow"
echo -e "Support Yaml     : YES"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link TLS         : ${vmesslink1}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link None TLS    : ${vmesslink2}"
echo -e "\e[$line•────────────────•\e[m"
echo -e "Link Yaml    : http://$MYIP:81/$user-clash-for-android.yaml"
echo -e "\e[$line•────────────────•\e[m"
echo -e "\e[$line TLS QRcode\e[m"
qrencode -t ansiutf8 "vmess://$(base64 -w 0 /usr/local/etc/xray/$user-tls.json)"
echo -e "\e[$line NTLS QRcode\e[m"
qrencode -t ansiutf8 "vmess://$(base64 -w 0 /usr/local/etc/xray/$user-none.json)" 
echo ""
echo -e "Created     : $harini"
echo -e "Expired     : $exp"
echo ""
read -n 1 -s -r -p "Press any key to back on menu xray"
vmess-menu
}

# FUCTION CEK USER
function menu6 () {
clear
echo -n > /tmp/other.txt
data=( `cat /usr/local/etc/xray/vmess.json | grep '^#vms' | cut -d ' ' -f 2`); 
echo -e "\e[$line┌──────────────────────────────────────────────────────┐\e[m"
echo -e "\e[$line│             \e[$box XRAY Vmess WS User Login               \e[$line │ \e[m"
echo -e "\e[$line└──────────────────────────────────────────────────────┘\e[m"
for akun in "${data[@]}"
do
if [[ -z "$akun" ]]; then
akun="tidakada"
fi
echo -n > /tmp/ipvmess.txt
data2=( `netstat -anp | grep ESTABLISHED | grep tcp6 | grep xray | awk '{print $5}' | cut -d: -f1 | sort | uniq`);
for ip in "${data2[@]}"
do
jum=$(cat /var/log/xray/access.log | grep -w $akun | awk '{print $3}' | cut -d: -f1 | grep -w $ip | sort | uniq)
if [[ "$jum" = "$ip" ]]; then
echo "$jum" >> /tmp/ipvmess.txt
else
echo "$ip" >> /tmp/other.txt
fi
jum2=$(cat /tmp/ipvmess.txt)
sed -i "/$jum2/d" /tmp/other.txt > /dev/null 2>&1
done
jum=$(cat /tmp/ipvmess.txt)
if [[ -z "$jum" ]]; then
echo > /dev/null
else
jum2=$(cat /tmp/ipvmess.txt | nl)
echo "user : $akun";
echo "$jum2";
echo ""
echo -e "\e[$line•──────────────────────────────────•\e[m"
fi
rm -rf /tmp/ipvmess.txt
rm -rf /tmp/other.txt
done
echo ""
read -n 1 -s -r -p "    Press any key to back on menu xray"
vmess-menu
}
# MENU XRAY VMESS & VLESS
clear
echo -e ""
echo -e "   \e[$line┌──────────────────────────────────────────────────────┐\e[m"
echo -e "   \e[$line│\e[$box            PANEL XRAY VMESS WEBSOCKET TLS            \e[$line│\e[m"
echo -e "   \e[$line└──────────────────────────────────────────────────────┘ \e[m"
echo -e "      [\e[$number 01${NC}]\e[$below • Create Vmess Websocket Account\e[m"
echo -e "      [\e[$number 02${NC}]\e[$below • Trial User Vmess Websocket\e[m"
echo -e "      [\e[$number 03${NC}]\e[$below • Delete Vmess Websocket Account\e[m"
echo -e "      [\e[$number 04${NC}]\e[$below • Renew Vmess Websocket Account\e[m"
echo -e "      [\e[$number 05${NC}]\e[$below • Show Config Vmess Account\e[m"
echo -e "      [\e[$number 06${NC}]\e[$below • Check User Login Vmess\e[m"
echo -e ""
echo -e "                 Press [ x ] To Go Main Menu "
echo -e ""
read -rp "        Please Input Number  [1-6 or x] :  "  num
echo -e ""
if [[ "$num" = "1" ]]; then
menu1
elif [[ "$num" = "2" ]]; then
menu2
elif [[ "$num" = "3" ]]; then
menu3
elif [[ "$num" = "4" ]]; then
menu4
elif [[ "$num" = "5" ]]; then
menu5
elif [[ "$num" = "6" ]]; then
menu6
elif [[ "$num" = "x" ]]; then
menu
else
echo -e "\e[1;31mYou Entered The Wrong Number, Please Try Again!\e[0m"
sleep 1
vmess-menu
fi
