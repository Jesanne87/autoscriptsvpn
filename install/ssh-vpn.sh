#!/bin/bash
#wget https://github.com/${GitUser}/
GitUser="Jesanne87"
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
#Style
fun_bar() {
    CMD[0]="$1"
    CMD[1]="$2"
    (
        [[ -e $HOME/fim ]] && rm $HOME/fim
        ${CMD[0]} -y >/dev/null 2>&1
        ${CMD[1]} -y >/dev/null 2>&1
        touch $HOME/fim
    ) >/dev/null 2>&1 &
    tput civis
    echo -ne "\033[0;33mDowloading Scripts \033[1;37m- \033[0;33m["
    while true; do
        for ((i = 0; i < 18; i++)); do
            echo -ne "\033[0;32m#"
            sleep 0.1s
        done
        [[ -e $HOME/fim ]] && rm $HOME/fim && break
        echo -e "\033[0;33m]"
        sleep 1s
        tput cuu1
        tput dl1
        echo -ne "\033[0;33mPlease Wait \033[1;37m- \033[0;33m["
    done
    echo -e "\033[0;33m]\033[1;37m -\033[1;32mDownload Complete !\033[1;37m"
    tput cnorm
    }
# // initializing var
export DEBIAN_FRONTEND=noninteractive
MYIP=$(wget -qO- icanhazip.com);
MYIP2="s/xxxxxxxxx/$MYIP/g";
NET=$(ip -o $ANU -4 route show to default | awk '{print $5}');
source /etc/os-release
ver=$VERSION_ID

# // detail nama perusahaan
country="MY"
state="Sabah"
locality="KK"
organization="@Phantom"
organizationalunit="@Phantom"
commonname="JsPhantom"
email="admin@JsPhantom.com"

# // autoscriptsvpn password minimal
wget -O /etc/pam.d/common-password "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/password"
chmod +x /etc/pam.d/common-password

# // go to root
cd

# // Edit file /etc/systemd/system/rc-local.service
cat > /etc/systemd/system/rc-local.service <<-END
[Unit]
Description=/etc/rc.local
ConditionPathExists=/etc/rc.local
[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99
[Install]
WantedBy=multi-user.target
END

# // nano /etc/rc.local
cat > /etc/rc.local <<-END
#!/bin/sh -e
# rc.local
# By default this script does nothing.
exit 0
END

# // Ubah izin akses
chmod +x /etc/rc.local

# // enable rc local
systemctl enable rc-local
systemctl start rc-local.service

# // disable ipv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local

# // update
apt update -y
apt upgrade -y
apt dist-upgrade -y
apt-get remove --purge ufw firewalld -y
apt-get remove --purge exim4 -y

# // install wget and curl
apt -y install wget curl

#Qrcode
apt -y install qrencode

# install clouflare JQ
apt install jq curl -y

# // set time GMT +8
ln -fs /usr/share/zoneinfo/Asia/Kuala_Lumpur /etc/localtime

# // set locale
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config

# // install
apt-get --reinstall --fix-missing install -y bzip2 gzip coreutils wget screen rsyslog iftop htop net-tools zip unzip wget net-tools curl nano sed screen gnupg gnupg1 bc apt-transport-https build-essential dirmngr libxml-parser-perl neofetch git lsof
echo "clear" >> .profile
echo "menu" >> .profile

# // install webserver
apt -y install nginx
cd
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
wget -O /etc/nginx/nginx.conf "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/nginx.conf"
mkdir -p /home/vps/public_html
wget -O /etc/nginx/conf.d/vps.conf "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/vps.conf"
/etc/init.d/nginx restart

# // install badvpn
cd
wget -O /usr/bin/badvpn-udpgw "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/badvpn-udpgw64"
chmod +x /usr/bin/badvpn-udpgw
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500' /etc/rc.local
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 500

# // setting port ssh
cd
apt-get -y update
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g'

# /etc/ssh/sshd_config
sed -i '/Port 22/a Port 500' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 40000' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 51443' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 58080' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 200' /etc/ssh/sshd_config
sed -i 's/#Port 22/Port 22/g' /etc/ssh/sshd_config
/etc/init.d/ssh restart

# // install dropbear
apt -y install dropbear
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=143/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 109 -p 68 -p 69 -p 110"/g' /etc/default/dropbear
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
/etc/init.d/dropbear restart

# // install squid for debian 9,10 & ubuntu 20.04
apt -y install squid3

# install squid for debian 11
apt -y install squid
wget -O /etc/squid/squid.conf "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/squid3.conf"
sed -i $MYIP2 /etc/squid/squid.conf

# // setting vnstat
apt -y install vnstat
/etc/init.d/vnstat restart
apt -y install libsqlite3-dev
wget https://humdi.net/vnstat/vnstat-2.6.tar.gz
tar zxvf vnstat-2.6.tar.gz
cd vnstat-2.6
./configure --prefix=/usr --sysconfdir=/etc && make && make install
cd
vnstat -u -i $NET
sed -i 's/Interface "'""eth0""'"/Interface "'""$NET""'"/g' /etc/vnstat.conf
chown vnstat:vnstat /var/lib/vnstat -R
systemctl enable vnstat
/etc/init.d/vnstat restart
rm -f /root/vnstat-2.6.tar.gz
rm -rf /root/vnstat-2.6

# // install stunnel
apt install stunnel4 -y
cat > /etc/stunnel/stunnel.conf <<-END
cert = /etc/stunnel/stunnel.pem
client = no
socket = a:SO_REUSEADDR=1
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1

[dropbear]
accept = 222
connect = 127.0.0.1:22

[dropbear]
accept = 777
connect = 127.0.0.1:109

[openvpn]
accept = 442
connect = 127.0.0.1:1194

[kontol-stunnel]
accept = 2096
connect = 127.0.0.1:2091
END

# // make a certificate
openssl genrsa -out key.pem 2048
openssl req -new -x509 -key key.pem -out cert.pem -days 1095 \
-subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email"
cat key.pem cert.pem >> /etc/stunnel/stunnel.pem

# // konfigurasi stunnel
sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
/lib/systemd/systemd-sysv-install enable stunnel4
systemctl start stunnel4
/etc/init.d/stunnel4 restart

# // OpenVPN
wget https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/ovpn/vpn.sh &&  chmod +x vpn.sh && ./vpn.sh

# // install fail2ban
apt -y install fail2ban

# // Instal DDOS Flate
if [ -d '/usr/local/ddos' ]; then
	echo; echo; echo "Please un-install the previous version first"
	exit 0
else
	mkdir /usr/local/ddos
fi
clear
echo; echo 'Installing DOS-Deflate 0.6'; echo
echo; echo -n 'Downloading source files...'
wget -q -O /usr/local/ddos/ddos.conf http://www.inetbase.com/scripts/ddos/ddos.conf
echo -n '.'
wget -q -O /usr/local/ddos/LICENSE http://www.inetbase.com/scripts/ddos/LICENSE
echo -n '.'
wget -q -O /usr/local/ddos/ignore.ip.list http://www.inetbase.com/scripts/ddos/ignore.ip.list
echo -n '.'
wget -q -O /usr/local/ddos/ddos.sh http://www.inetbase.com/scripts/ddos/ddos.sh
chmod 0755 /usr/local/ddos/ddos.sh
cp -s /usr/local/ddos/ddos.sh /usr/local/sbin/ddos
echo '...done'
echo; echo -n 'Creating cron to run script every minute.....(Default setting)'
/usr/local/ddos/ddos.sh --cron > /dev/null 2>&1
echo '.....done'
echo; echo 'Installation has completed.'
echo 'Config file is at /usr/local/ddos/ddos.conf'
echo 'Please send in your comments and/or suggestions to zaf@vsnl.com'

# // banner /etc/issue.net
wget -O /etc/issue.net "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/bannerssh.conf"
echo "Banner /etc/issue.net" >>/etc/ssh/sshd_config
sed -i 's@DROPBEAR_BANNER=""@DROPBEAR_BANNER="/etc/issue.net"@g' /etc/default/dropbear

# // blockir torrent
iptables -A FORWARD -m string --string "get_peers" --algo bm -j DROP
iptables -A FORWARD -m string --string "announce_peer" --algo bm -j DROP
iptables -A FORWARD -m string --string "find_node" --algo bm -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -A FORWARD -m string --algo bm --string "peer_id=" -j DROP
iptables -A FORWARD -m string --algo bm --string ".torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -A FORWARD -m string --algo bm --string "torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce" -j DROP
iptables -A FORWARD -m string --algo bm --string "info_hash" -j DROP
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload

# // download script
clear
cd /usr/bin
echo -e "${GB}[ INFO ]${NC} ${YB}Downloading Scripts${NC}"
install_scripts () {
wget -q -O add-host "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/system/add-host.sh"
wget -q -O about "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/system/about.sh"
wget -q -O menu "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/menu/menu.sh"
wget -q -O add-ssh "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/ssh/add-ssh.sh"
wget -q -O trial "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/ssh/trial.sh"
wget -q -O del-ssh "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/ssh/del-ssh.sh"
wget -q -O member "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/ssh/member.sh"
wget -q -O delete "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/ssh/delete.sh"
wget -q -O cek-ssh "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/ssh/cek-ssh.sh"
wget -q -O restart "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/system/restart.sh"
wget -q -O speedtest "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/system/speedtest_cli.py"
wget -q -O info "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/system/info.sh"
wget -q -O renew-ssh "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/ssh/renew-ssh.sh"
wget -q -O autokill "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/ssh/autokill.sh"
wget -q -O ceklim "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/ssh/ceklim.sh"
wget -q -O tendang "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/ssh/tendang.sh"
wget -q -O clean-ram "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/system/clean-ram.sh"
wget -q -O change-port "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/menu/change.sh"
wget -q -O port-ovpn "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/change-port/port-ovpn.sh"
wget -q -O port-ssl "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/change-port/port-ssl.sh"
wget -q -O port-squid "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/change-port/port-squid.sh"
wget -q -O port-websocket "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/change-port/port-websocket.sh"
wget -q -O xp "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/system/xp.sh"
wget -q -O user-list "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/ssh/user-list.sh"
wget -q -O user-lock "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/ssh/user-lock.sh"
wget -q -O user-unlock "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/ssh/user-unlock.sh"
wget -q -O user-password "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/ssh/user-password.sh"
wget -q -O cfa "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/cloud/cfa.sh"
wget -q -O cfd "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/cloud/cfd.sh"
wget -q -O cfp "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/cloud/cfp.sh"
wget -q -O check-sc "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/system/running.sh"
wget -q -O ssh "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/menu/ssh.sh"
wget -q -O autoreboot "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/system/autoreboot.sh"
wget -q -O port-ohp "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/change-port/port-ohp.sh"
wget -q -O port-xray "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/change-port/port-xray.sh"
wget -q -O system "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/menu/system.sh"
wget -q -O update "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/update/update.sh"
wget -q -O run-update "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/update/run-update.sh"
wget -q -O dns "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/system/dns.sh"
wget -q -O nf "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/system/nf.sh"
wget -q -O traffic "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/traffic.sh"
wget -q -O log-cleaner "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/clear-log.sh"
wget -q -O xrayacc "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/system/xrayacc.sh"
wget -q -O limit-speed "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/system/limit-speed.sh"
wget -q -O backup "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/system/backup.sh"
wget -q -O restore "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/system/restore.sh"
wget -q -O certv2ray "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/cloud/cert.sh"
wget -q -O trojaan "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/menu/trojaan.sh"
wget -q -O xray-menu "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/menu/xray-menu.sh"
wget -q -O vless-menu "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/menu/vless-menu.sh"
wget -q -O vmess-menu "https://raw.githubusercontent.com/${GitUser}/autoscriptsvpn/main/menu/vmess-menu.sh"
}
fun_bar 'install_scripts'
echo -e "${GB}[ INFO ]${NC} ${YB}Download All Scripts Done${NC}"
sleep 1
clear
chmod +x add-host
chmod +x menu
chmod +x add-ssh
chmod +x trial
chmod +x del-ssh
chmod +x member
chmod +x delete
chmod +x cek-ssh
chmod +x restart
chmod +x speedtest
chmod +x info
chmod +x about
chmod +x autokill
chmod +x tendang
chmod +x ceklim
chmod +x renew-ssh
chmod +x clean-ram
chmod +x change-port
chmod +x port-ovpn
chmod +x port-ssl
chmod +x port-squid
chmod +x port-websocket
chmod +x xp
chmod +x user-list
chmod +x user-lock
chmod +x user-unlock
chmod +x user-password
chmod +x cfa
chmod +x cfd
chmod +x cfp
chmod +x check-sc
chmod +x ssh
chmod +x autoreboot
chmod +x port-ohp
chmod +x port-xray
chmod +x system
chmod +x update
chmod +x run-update
chmod +x dns
chmod +x nf
chmod +x traffic
chmod +x log-cleaner
chmod +x xrayacc
chmod +x limit-speed
chmod +x backup
chmod +x restore
chmod +x certv2ray
chmod +x trojaan
chmod +x xray-menu
chmod +x vless-menu
chmod +x vmess-menu

echo "0 0 * * * root delete" >> /etc/crontab
echo "*/2 * * * * root clear-log" >> /etc/crontab
echo "0 5 * * * root reboot" >> /etc/crontab
echo "0 0 * * * root xp" >> /etc/crontab
echo "30 23 * * * root autobackup" >> /etc/crontab

# // remove unnecessary files
cd
apt autoclean -y
apt -y remove --purge unscd
apt-get -y --purge remove samba*;
apt-get -y --purge remove apache2*;
apt-get -y --purge remove bind9*;
apt-get -y remove sendmail*
apt autoremove -y

# // finishing
cd
chown -R www-data:www-data /home/vps/public_html
/etc/init.d/nginx restart
/etc/init.d/openvpn restart
/etc/init.d/cron restart
/etc/init.d/ssh restart
/etc/init.d/dropbear restart
/etc/init.d/fail2ban restart
/etc/init.d/vnstat restart
/etc/init.d/stunnel4 restart
/etc/init.d/squid restart
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 500
history -c
echo "unset HISTFILE" >> /etc/profile

cd
rm -f /root/key.pem
rm -f /root/cert.pem
rm -f /root/ssh-vpn.sh
clear